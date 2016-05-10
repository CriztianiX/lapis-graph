local db = require("lapis.db")

local schema = require 'graphql.schema'
local types = require 'graphql.types'
local User = require 'types.user'
local Post = require 'types.post'

return schema.create {
  query = types.object {
    name = 'Query',
    fields = {
      user = {
        kind = User,
        arguments = {
          id = types.id
        },
        resolve = function(rootValue, arguments)
          local res = db.query("SELECT * FROM users WHERE id = ?", arguments.id)
          return res[1]
        end
      }
    }
  }
}