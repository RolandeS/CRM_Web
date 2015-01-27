require 'sinatra'

get '/' do
  # "Main Menu"
  @crm_app_name = "My CRM"
  erb :index
end


