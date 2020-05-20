// Entry point for serverless Apollo Server Lambda 
// graphql.js
import schema  = require('./services/graphql_init');
const { ApolloServer, gql } = require('apollo-server-lambda');
import { GraphQLRequestContext } from "apollo-server-types";

// Make sure database connection is setup
import sequelize = require('./services/db');
console.log('Initialized Sequelize', sequelize.Sequelize);

const myPlugin = {
  serverWillStart() {
    console.log("Server starting");
  },

  requestDidStart(requestContext: GraphQLRequestContext) {
    console.log("Request started", requestContext);

    return {
      parsingDidStart(requestContext: GraphQLRequestContext) {
        console.log('Parsing started!', requestContext);
        return (err: Error) => {
          if (err) {
            console.error(err);
          }
        }
      },

      validationDidStart(requestContext: GraphQLRequestContext) {
        console.log('Validation started!', requestContext);

        return (errs: [Error]) => {
          if (errs) {
            errs.forEach(err => console.error(err));
          }
        }
      },

      executionDidStart() {
        console.log("Execution did start");
        return (err: Error) => {
          if (err) {
            console.error(err);
          }
        }
      },

      willSendResponse() {
        console.log("Will Send Response");
      }
    }
  }
}

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
  plugins: [ myPlugin ],
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
