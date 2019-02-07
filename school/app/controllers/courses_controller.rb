class CoursesController < ApplicationController
    # CRUD (Create Read Update Destroy)
   
    # send back form to create   
    def new
    end
    
    # create course
    def create
        course = Course.new
        course.name = params[:name]
        course.location = params[:location]
        course.description = params[:description]
        course.save
        redirect_to '/courses'
    end
    
    # list all courses
    def index
        @courses=Course.all
    end
    
    # send back to edit
    def edit
        @course = Course.find(params[:id])
    end
    
    # update courses
    def update
        course = Course.find(params[:id])
        course.name = params[:name]
        course.location = params[:location]
        course.description = params[:description]
        course.save
        redirect_to '/courses'
    end
    
    # delete
    def delete
       course = Course.find(param[:id]) 
       course.destry
       redirect_to '/courses'
    end
    
    def show
        @course = Course.find(params[:id])
    end
end
