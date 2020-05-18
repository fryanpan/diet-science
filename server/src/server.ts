import express from 'express';
import bodyParser from 'body-parser'
import { graphqlExpress, graphiqlExpress }  from 'apollo-server-express';
import compression from 'compression';
import cors from 'cors';
import logger from 'morgan';
import schema  = require('./services/graphql_init');

import sequelize = require('./services/db');
console.log('Initialized Sequelize', sequelize.Sequelize);

const PORT = process.env.PORT || 3000;

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
