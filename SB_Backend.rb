require 'rubygems'
require 'mysql2'
require 'sinatra'
require 'sinatra/reloader'
require 'erb'

client = Mysql2::Client.new(
  :host => "140.134.26.31",
  :username => "root",
  :password => 'root',
  :database => "yang xin",
  :port => '3306'
)

get '/search' do
  @result = {}

  keyword = params["keyword"]

  puts keyword

  erb :SB
end

post '/search' do

  keyword = params["keyword"]
  puts keyword

  sql_result = client.query("SELECT * FROM zhigen WHERE title LIKE '%#{keyword}%' OR article LIKE '%#{keyword}%'")
  @result = sql_result

  # puts "result: #{sql_result.first['title']}"
  @result = sql_result

  erb :SB
end
