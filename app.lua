local lapis = require("lapis")
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

local schema = require 'schemas.schema'

-- Execution
local rootValue = {}

app:match("index", "/", json_params(capture_errors_json(respond_to({
  POST = function(self)
     validation.assert_valid(self.params, {
        { "query", exists = true },
        { "arguments", exists = true },
        { "operation_name", exists = true }
      })

     local query = parse(self.params.query)
     validate(schema, query)

    return {
        json = execute(schema, query, rootValue, 
          self.params.arguments, self.params.operation_name)
    }
  end
}))))

return app