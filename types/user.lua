local types = require 'graphql.types'

return types.object {
  name = 'User',
  fields = {
    id = types.id.nonNull,
    name = types.string.nonNull
  }
}