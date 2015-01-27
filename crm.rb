require 'sinatra'
require_relative 'contact' #or require './contact'

get '/' do
  # "Main Menu"
  @crm_app_name = "My CRM"
  erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	erb :new
end

