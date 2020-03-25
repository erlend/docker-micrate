require "micrate"
require "pg"

Micrate::DB.connection_url = ENV.fetch ENV.fetch("DATABASE_PROVIDER")
Micrate::Cli.run
