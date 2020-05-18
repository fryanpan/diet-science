/** Configure GraphQL endpoints */
import { gql } from 'apollo-server';
const { makeExecutableSchema } = require('graphql-tools');
import eventSamples from '../event_samples'
import dateResolver = require('../services/graphql_date');

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

export = schema