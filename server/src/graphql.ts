// Entry point for serverless Apollo Server Lambda 
// graphql.js
import schema  = require('./services/graphql_init');
const { ApolloServer, gql } = require('apollo-server-lambda');

// Make sure database connection is setup
import sequelize = require('./services/db');
console.log('Initialized Sequelize', sequelize.Sequelize);

const server = new ApolloServer({ 
  schema,
  context: ( { event, context }: any ) => {
    console.log(`Headers: ${JSON.stringify(event.headers)} Function: ${context.functionName}`);
    return ({
      headers: event.headers,
      functionName: context.functionName,
      event,
      context
    });
  },
  playground: {
    endpoint: "/dev/graphql"
  }
});

exports.graphqlHandler = server.createHandler({
  cors: {
    origin: '*',
    credentials: true
  }
});
