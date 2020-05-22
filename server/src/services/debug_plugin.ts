import { GraphQLRequestContext } from "apollo-server-types";

export const DebugPlugin = {
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