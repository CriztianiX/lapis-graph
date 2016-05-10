local types = require 'graphql.types'

return types.object {
  name = 'Post',
  fields = {
    id = types.id.nonNull,
    title = types.string.nonNull
  }
}