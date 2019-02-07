class GroupsController < ApplicationController
    # send back form to create   
    def new
    end
    
    # create group
    def create
        group = Group.new
        group.name = params[:name]
        group.comments = params[:comments]
        group.save
        redirect_to '/'
    end
    
    # list all groups
    def index
        @groups=Group.all
    end
    
    # send back to edit
    def edit
        @group = Group.find(params[:id])
    end
    
    # update group
    def update
        group = Group.find(params[:id])
        group.name = params[:name]
        group.comments = params[:comments]
        group.save
        redirect_to '/'
    end
    
    # delete group
    def delete
       group = Group.find(params[:id]) 
       group.destroy
       redirect_to '/'
    end
   
   #Show the students related with the class 
    def show

    end
    
end
