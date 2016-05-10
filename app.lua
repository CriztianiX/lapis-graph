local lapis = require("lapis")
local db = require("lapis.db")
local app = lapis.Application()
local json_params = require("lapis.application").json_params
local respond_to = require("lapis.application").respond_to
local capture_errors_json = require("lapis.application").capture_errors_json
local validation = require("lapis.validate")

local parse = require 'graphql.parse'
local schema = require 'graphql.schema'
local types = require 'graphql.types'
local validate = require 'graphql.validate'
local execute = require 'graphql.execute'

-- Create a type
local Person = types.object {
  name = 'Person',
  fields = {
    id = types.id.nonNull,
    name = types.string.nonNull
  }
}

-- Create a schema
local schema = schema.create {
  query = types.object {
    name = 'Query',
    fields = {
      person = {
        kind = Person,
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

-- Execution
local rootValue = {}
local operationName = 'getUser'

app:match("index", "/", json_params(capture_errors_json(respond_to({
  POST = function(self)
     validation.assert_valid(self.params, {
        { "query", exists = true },
        { "arguments", exists = true }
      })

     local query = parse(self.params.query)
     validate(schema, query)

    return {
        json = execute(schema, query, rootValue, self.params.arguments, operationName)
    }
  end
}))))

return app