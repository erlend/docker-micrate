require "micrate"
require "mysql"

Micrate::DB.connection_url = ENV.fetch ENV.fetch("DATABASE_PROVIDER")
Micrate::Cli.run
