require 'sinatra'
require_relative 'contact' #or require './contact'
require_relative 'rolodex'

$rolodex = Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	erb :new
end

get '/contact' do
	erb :construction
end
get '/update' do
	erb :construction
end
get '/delete' do
	erb :construction
end

post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(new_contact)
	redirect to('contacts')
end

