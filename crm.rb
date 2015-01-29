require 'sinatra'
require_relative 'contact' #or require './contact'
require_relative 'rolodex'

@@rolodex = Rolodex.new
$time = Time.now.ctime

@@rolodex.add_contact(Contact.new("Amy", "Su", "amysu@gmail.com", "mill eeieo llfkjhf ;khjdaf"))
@@rolodex.add_contact(Contact.new("Jon", "Ka", "jonka@gmail.com", "NOTe mdfkjhf ;khjdaf"))

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

# get '/contact' do
# 	@title = "CRM page under construction"
# 	erb :construction
# end

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
	@@rolodex.add_contact(new_contact)
	redirect to('contacts')
end

get '/contact_details' do
	@title = "Contact Details"
	erb :contact_details
end

get "/contacts/:id" do
	@title = "Display Contact"
	@contact = @@rolodex.display_particular_contact(params[:id].to_i)
	if @contact
		erb :display_contact
	else
		raise sinatra::NotFound
	end
end

put "/contacts/:id" do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email = params[:email]
		@contact.note = params[:note]

	redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end

get "/contacts/:id/edit" do
	@contact = @@rolodex.display_particular_contact(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		rais Sinatra::NotFound
	end
end

delete "/contacts/:id" do
	@contact = @@rolodex.find(params[:id].to_i)
	
	if @contact
		@@rolodex.remove_contact(@contact)
		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end

# get '/display_contact' do
# 	puts "Params: #{params.inspect}"
# 	@id = params[:id]
# 	@title = "Display Contact"
# 	erb :display_contact
# end

# post '/display_contact' do
# 	@find_contact= @@rolodex.display_particular_contact(params[:id])
# 	redirect to('display_contact')
# end

