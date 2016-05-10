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
  end,
  [1462975524] = function()
    schema.create_table("posts", {
      { "id", types.serial },
      { "title", types.text },
      { "user_id", types.integer },

      "PRIMARY KEY (id)"
    })
    db.query("INSERT INTO posts(user_id,title) VALUES(1, 'Title 1')")
    db.query("INSERT INTO posts(user_id,title) VALUES(2, 'Title 2')")
    db.query("INSERT INTO posts(user_id,title) VALUES(3, 'Title 3')")
    db.query("INSERT INTO posts(user_id,title) VALUES(4, 'Title 4')")
    db.query("INSERT INTO posts(user_id,title) VALUES(1, 'Title 5')")
  end,
}