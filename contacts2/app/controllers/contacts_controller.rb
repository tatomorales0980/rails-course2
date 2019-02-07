class ContactsController < ApplicationController
    # CRUD (Create Read Update Destroy)
   
    # send back form to create   
    def new
    end
    
    # create contact
    def create
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
        redirect_to '/'        
    end
    
    # list all contacts
    def index
        @contacts = Contact.all
    end
    
    # send back to edit
    def edit
        @contact = Contact.find(params[:id])
    end
    
    # update contact
    def update
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
        redirect_to '/'
    end
    
    # delete contact
    def delete
        @contact = Contact.find_by_id(params[:id])
        @contact.delete
        redirect_to '/'  
    end
    
    # search by name
    def search
        query = "%#{params[:search_bothname]}%"
        @contacts=Contact.where("first_name LIKE ? OR last_name LIKE ?", query,query)
    end
    
    # def search_lastname
    #     lastname = params[:search_lastname]
    #     @contacts=Contact.where(last_name: lastname)
    # end
    
    # def search_bothname
    #     query = "%#{params[:search_bothname]}%"
    #     @contacts=Contact.where("first_name LIKE ? OR last_name LIKE ?", query,query)
    # end    
end
