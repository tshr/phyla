require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'active_record'
require 'pry'
require_relative 'models/init'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: File.expand_path("../db/ITIS.sqlite", __FILE__)
)

get '/' do
  binding.pry
end