require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'active_record'
require 'pry'
require_relative 'core_extensions/init'
require_relative 'models/init'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: File.expand_path("../db/ITIS.sqlite", __FILE__)
)

get '/' do
  erb :index
end

get '/taxonomic_unit/:tsn' do
  content_type :json

  species = TaxonomicUnit.find_by(tsn: params[:tsn])
  species ? species.to_json : (status 404)
end