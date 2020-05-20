/** Add support for the Date type to GraphQL 
 * 
 * In transport in the GraphQL API, encoded as milliseconds since epoch
 * For storage and usage internally here, we use a Javascript Date object.
 * 
 * Note the use of a relatively obscure identifier "DateScalarType"
 * 
 * Integration of custom scalar types in the iOS Apollo library is fragile and hacky
 * And works better with an unusual, unambiguous type name.
 */

import { GraphQLScalarType } from 'graphql';
import { Kind } from 'graphql/language';

const resolverMap = {
  DateScalarType: new GraphQLScalarType({
    name: 'DateScalarType',
    description: 'Date custom scalar type',
    parseValue(value) {
      return new Date(value); // value from the client
    },
    serialize(value) {
      return value.getTime(); // value sent to the client
    },
    parseLiteral(ast) {
      if (ast.kind === Kind.INT) {
        return new Date(+ast.value) // ast value is always in string format
      }
      return null;
    },
  }),
};

export = resolverMap;