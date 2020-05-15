import { gql } from 'apollo-server';


export const typeDef = gql`
  type EventSample {
    eventId: String
    startDate: String
    endDate: String
    value: Float
  }
  extend type Query {
    eventSamples: [EventSample]
  }
`;