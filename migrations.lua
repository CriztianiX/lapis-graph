local schema = require("lapis.db.schema")
local types = schema.types
local db = require("lapis.db")

return {
  [1368686844] = function()
    schema.create_table("users", {
      { "id", types.serial },
      { "name", types.text },

      "PRIMARY KEY (id)"
    })
  end,
  [1368686845] = function()
    db.query("INSERT INTO users(name) VALUES('Juan')")
    db.query("INSERT INTO users(name) VALUES('Jose')")
    db.query("INSERT INTO users(name) VALUES('Cristian')")
    db.query("INSERT INTO users(name) VALUES('Eduardo')")
  end
}