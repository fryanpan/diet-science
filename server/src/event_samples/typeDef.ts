import { gql } from 'apollo-server';


export const typeDef = gql`
  scalar Date

  input EventSampleInput {
    eventId: String
    startDate: Date
    endDate: Date
    value: Float
  }

  type EventSample {
    id: ID
    eventId: String
    startDate: Date
    endDate: Date
    value: Float
  }
  extend type Query {
    eventSamples: [EventSample]
  }

  extend type Mutation {
    createEventSample(input: EventSampleInput): EventSample!
    updateEventSample(id: ID, input: EventSampleInput): EventSample!
  }
`;