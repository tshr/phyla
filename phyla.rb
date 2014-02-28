require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database:  '/Users/toshirokensugihara/projects/ruby_projects/phyla/db/ITIS.sqlite'
)

class Kingdom < ActiveRecord::Base
end

get '/' do
   kingdoms = Kingdom.all
   binding.pry
end