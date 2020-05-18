// Entry point for serverless Apollo Server Lambda 
// graphql.js
import schema  = require('./services/graphql_init');
const { ApolloServer, gql } = require('apollo-server-lambda');

console.log(`Here's my schema: ${{ schema }}`);

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
    endpoint: "/development/graphql"
  }
});

exports.graphqlHandler = server.createHandler({
  cors: {
    origin: '*',
    credentials: true
  }
});
