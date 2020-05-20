import { EventSampleDAO } from './model'
import { EventSampleInput } from './typeDef'

export const resolvers = {
  Query: {
    eventSamples: EventSampleDAO.all,
  },

  Mutation: {
    createEventSamples: (obj: any, args: any) => EventSampleDAO.create(args.input as [EventSampleInput]),
    updateEventSample: (obj: any, args: any) => EventSampleDAO.update(args.id, args.input as EventSampleInput)
  }
};
