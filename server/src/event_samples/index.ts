import { samples } from './data'
import model from './model'
import { resolvers } from './resolvers'
import { typeDef } from './typeDef'

export default {
  model: model,
  data: samples,
  resolvers: resolvers,
  typeDef: typeDef
}
