require 'active_record'

options = {
  adapter:"postgresql",
  database:"sweatr"
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)