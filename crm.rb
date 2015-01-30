
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact

	include DataMapper::Resource

	property :id, Serial
	property :first_name, String
	property :last_name, String
	property :email, String
	property :note, String


	# attr_accessor :id, :first_name, :last_name, :email, :note

	# def initialize (first_name, last_name, email, note)
	# 	@first_name = first_name
	# 	@last_name = last_name
	# 	@email = email
	# 	@note = note
	# end
end

DataMapper.finalize
DataMapper.auto_upgrade!

#end of DM setup

$time = Time.now.ctime

#begin Sinatra routes

get '/' do
  @title = "RO"
  erb :index
end

get '/crm_page' do
	@title = "RO CRM"
	@crm_app_name = "RO CRM"
	erb :crm_page
end

get '/contacts' do
	@title = "Contacts"
	@contact = Contact.all
	erb :contacts
end

get '/contacts/new' do
	@title = "Add a contact"
	erb :new_contact
end


post '/contacts' do
	# NEW
	# new_contact = Contacts.create(
	# 	first_name: params[:first_name],
	# 	last_name: params[:last_name],
	# 	email: params[:email],
	# 	note: params[:note],
	# 	)
	# # new_contact.save

	contact = Contact.create(
	    :first_name => params[:first_name],
	    :last_name => params[:last_name],
	    :email => params[:email],
	    :note => params[:note]
  	)
	redirect to('/contacts')
end

get "/contacts/:id" do
	@title = "Display Contact"
	@contact = Contact.get(params[:id].to_i)
	
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
end

get "/contacts/:id/edit" do
	@contact = Contact.get(params[:id].to_i)
	
	if @contact
		erb :edit_contact
	else
		rais Sinatra::NotFound
	end
end

put "/contacts/:id" do
	
	@contact = Contact.get(params[:id].to_i)
	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email = params[:email]
		@contact.note = params[:note]
		@contact.save #?????
	redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end


delete "/contacts/:id" do
	@contact = Contact.get(params[:id].to_i)
	

	if @contact
		@contact.destroy
		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end
