local config = require("lapis.config")
config({"development", "production"}, {
  port = 9900,
  postgres = {
    host     = "127.0.0.1",
    database = "graph0",
    user     = "graph0",
    password = "qwe123",
    backend  =  "pgmoon"
  }
})
