import express from 'express';
import bodyParser from 'body-parser'
import compression from 'compression';
import cors from 'cors';
import logger from 'morgan';
import schema  = require('./services/graphql_init');
import { ApolloServer } from 'apollo-server-express';

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
  res.send("Hello World!");
})

// Setup GraphQL endpoint
const server = new ApolloServer({ schema });
server.applyMiddleware({ app });

// Start the server
app.listen(PORT, () => {
  console.log(`🚀 Server ready at http://localhost:${PORT}${server.graphqlPath}`)
});
