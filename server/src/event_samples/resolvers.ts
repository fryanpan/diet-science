import EventSample from './EventSample'

export const resolvers = {
  Query: {
    eventSamples: () => EventSample.all(),
  },
};
