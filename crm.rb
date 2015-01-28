require 'sinatra'
require_relative 'contact' #or require './contact'
require_relative 'rolodex'

$rolodex = Rolodex.new
$time = Time.now.ctime
get '/' do
  @title = "RO"
  erb :index
end

get '/crm_page' do
	@title = "RO CRM"
	@crm_app_name = "RO CRM at BitmakerLab"
	erb :crm_page
end

get '/contacts' do
	@title = "Contacts"
	erb :contacts
end

get '/contacts/new' do
	@title = "Add a contact"
	erb :new
end

get '/contact' do
	@title = "CRM page under construction"
	erb :construction
end

get '/update' do
	@title = "CRM page under construction"
	erb :construction
end

get '/delete' do
	@title = "CRM page under construction"
	erb :construction
end

post '/contacts' do
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(new_contact)
	redirect to('contacts')
end

