import { gql } from 'apollo-server';

/** Typescript definition */
export interface EventSampleInput {
  eventId: string,
  startDate: number,
  endDate: number,
  value: number
}

export const typeDef = gql`
  scalar DateScalarType

  input EventSampleInput {
    eventId: String
    startDate: DateScalarType
    endDate: DateScalarType
    value: Float
  }

  type EventSample {
    id: ID
    eventId: String
    startDate: DateScalarType
    endDate: DateScalarType
    value: Float
  }
  extend type Query {
    eventSamples: [EventSample]
  }

  extend type Mutation {
    createEventSamples(input: [EventSampleInput]): [EventSample]!
    updateEventSample(id: ID, input: EventSampleInput): EventSample!
  }
`;