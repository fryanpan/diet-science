import express from 'express';
import bodyParser from 'body-parser'
import { graphqlExpress, graphiqlExpress }  from 'apollo-server-express';
import compression from 'compression';
import cors from 'cors';
import logger from 'morgan';

const { makeExecutableSchema } = require('graphql-tools');

const PORT = process.env.PORT || 3000;

// Some fake data
const books = [
  {
    title: "Harry Potter and the Sorcerer's stone",
    author: 'J.K. Rowling',
  },
  {
    title: 'Jurassic Park',
    author: 'Michael Crichton',
  },
];

// The GraphQL schema in string form
const typeDefs = `
  type Query { books: [Book] }
  type Book { title: String, author: String }
`;

// The resolvers
const resolvers = {
  Query: { books: () => books },
};

// Put together a schema
const schema = makeExecutableSchema({
  typeDefs,
  resolvers,
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