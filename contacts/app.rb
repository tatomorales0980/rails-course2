require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

set :database, { adapter: "sqlite3", database: "contacts.db" }

class Contact < ActiveRecord::Base
end    

get '/' do
    @contacts=Contact.all
    erb :contacts
end

get '/contacts/new' do
    erb :new_contact
end

post '/contacts' do
    contact=Contact.new
    contact.first_name = params[:first_name]
    contact.last_name = params[:last_name]
    contact.phone = params[:phone]
    contact.email = params[:email]
    contact.address = params[:address]
    contact.city = params[:city]
    contact.state = params[:state]
    contact.zip = params[:zip]
    contact.save
    redirect '/'
end

get '/contacts/edit' do
    @contact = Contact.find(params[:id])
    erb :edit
end

post '/contacts/edit' do
    contact = Contact.find(params[:id])
    contact.first_name = params[:first_name]
    contact.last_name = params[:last_name]
    contact.phone = params[:phone]
    contact.email = params[:email]
    contact.address = params[:address]
    contact.city = params[:city]
    contact.state = params[:state]
    contact.zip = params[:zip]
    contact.save
    redirect '/'
end

get '/contacts/delete' do
    @contact = Contact.find_by_id(params[:id])
    @contact.delete
    redirect '/'    
end

post '/contacts/search_firstname' do
    firstname = params[:search_firstname]
    @contacts=Contact.where(first_name: firstname)
    erb :search
end

post '/contacts/search_lastname' do
    lastname = params[:search_lastname]
    @contacts=Contact.where(last_name: lastname)
    erb :search    
end

post '/contacts/search_bothname' do
    query = "%#{params[:search_bothname]}%"
    @contacts=Contact.where("first_name LIKE ? OR last_name LIKE ?", query,query)
    erb :search
end