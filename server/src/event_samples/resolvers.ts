import { EventSampleDAO } from './model'

export const resolvers = {
  Query: {
    eventSamples: EventSampleDAO.all,
  },

  Mutation: {
    createEventSample: (obj: any, args: any) => EventSampleDAO.create(args.input),
    updateEventSample: (obj: any, args: any) => EventSampleDAO.update(args.id, args.input)
  }
};
