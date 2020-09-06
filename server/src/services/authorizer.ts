/* From Serverless Sample code in 
    https://raw.githubusercontent.com/serverless/examples/master/aws-node-auth0-custom-authorizers-api/handler.js */

import { APIGatewayEvent, Context, Handler, Callback, AuthResponse, PolicyDocument, 
    Statement, StatementAction, StatementResource } from 'aws-lambda';
import jwt from 'jsonwebtoken';

// Set in `environment` of serverless.yml
const AUTH0_CLIENT_ID = process.env.AUTH0_CLIENT_ID;
const AUTH0_CLIENT_PUBLIC_KEY = process.env.AUTH0_CLIENT_PUBLIC_KEY;

// Policy helper function
const generatePolicy = (principalId: string, effect: string, resource: string) => {
    const statement: Statement = {
        Action: 'execute-api:Invoke',
        Effect: effect,
        Resource: resource
    };

    const policyDocument: PolicyDocument = {
        Version:  '2012-10-17',
        Statement: [ statement ] 
    };

    const authResponse: AuthResponse = {
        principalId,
        policyDocument
    };
    return authResponse;
};

interface AuthGatwayEvent extends APIGatewayEvent {
    authorizationToken: string
    methodArn: string
}

// Reusable Authorizer function, set on `authorizer` field in serverless.yml
export const authorizerFunc: Handler = (event: AuthGatwayEvent, 
    context: Context, callback: Callback): any => {
  console.log('event', event);
  if (!event.authorizationToken) {
    return callback('Unauthorized');
  }

  const tokenParts = event.authorizationToken.split(' ');
  const tokenValue = tokenParts[1];

  if (!(tokenParts[0].toLowerCase() === 'bearer' && tokenValue)) {
    // no auth token!
    return callback('Unauthorized');
  }
  const options = {
    audience: AUTH0_CLIENT_ID,
  };

  try {
    jwt.verify(tokenValue, AUTH0_CLIENT_PUBLIC_KEY, options, (verifyError, decoded) => {
      if (verifyError) {
        console.log('verifyError', verifyError);
        // 401 Unauthorized
        console.log(`Token invalid. ${verifyError}`);
        return callback('Unauthorized');
      }
      // is custom authorizer function
      console.log('valid from customAuthorizer', decoded);
      return callback(null, generatePolicy(decoded.sub, 'Allow', event.methodArn));
    });
  } catch (err) {
    console.log('catch error. Invalid token', err);
    return callback('Unauthorized');
  }
};