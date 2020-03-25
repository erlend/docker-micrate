require "micrate"
require "sqlite3"

Micrate::DB.connection_url = ENV.fetch ENV.fetch("DATABASE_PROVIDER")
Micrate::Cli.run
