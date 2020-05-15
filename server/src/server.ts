import express from 'express';
import bodyParser from 'body-parser'
import { graphqlExpress, graphiqlExpress }  from 'apollo-server-express';
import { gql } from 'apollo-server';
import compression from 'compression';
import cors from 'cors';
import logger from 'morgan';
import eventSamples from './event_samples'
import dateResolver = require('./services/graphql_date'); 

import sequelize = require('./services/db');
console.log('Initialized Sequelize', sequelize);

const { makeExecutableSchema } = require('graphql-tools');

const PORT = process.env.PORT || 3000;

// The GraphQL schema in string form
const typeDef = gql`
  type Query
  type Mutation
`;

// Put together a schema
const schema = makeExecutableSchema({
  typeDefs: [typeDef, eventSamples.typeDef],
  resolvers: [eventSamples.resolvers, dateResolver],
});

// Initialize the app
const app = express();

// Add a request logger
app.use( logger( 'dev' ));

// Handle all pre-flight OPTIONS requests by allowing all origins
app.options( '*', cors());

app.use(compression());

app.get("/", (req, res) => {
  res.send("Hello World");
})

// The GraphQL endpoint
app.use(
  '/graphql', 
  bodyParser.json(), 
  graphqlExpress({ schema })
);

// GraphiQL, a visual editor for queries
app.use(
  '/graphiql', 
  graphiqlExpress({ endpointURL: '/graphql' })
);

// Start the server
app.listen(PORT, () => {
  console.log('Go to http://localhost:3000/graphiql to run queries!');
});
