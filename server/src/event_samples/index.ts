import { samples } from './data'
import EventSample from './EventSample'
import { resolvers } from './resolvers'
import { typeDef } from './typeDef'

export default {
  model: EventSample,
  data: samples,
  resolvers: resolvers,
  typeDef: typeDef
}
