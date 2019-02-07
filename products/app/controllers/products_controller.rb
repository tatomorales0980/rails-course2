class ProductsController < ApplicationController
    # send back form to create   
    def new
        @groups = Group.all
    end
    
    # create product
    def create
        product = Product.new
        product.bar_code = params[:bar_code]
        product.description = params[:description]
        product.price = params[:price]
        product.group_id = params[:group_id]
        product.save
        redirect_to '/'
    end
    
    # list all products
    def index
        @products=Product.all
    end
    
    # send back to edit
    def edit
        @product = Product.find(params[:id])
        @group = Group.all
    end
    
    # update group
    def update
        product = Product.find(params[:id])
        product.bar_code = params[:name]
        product.description = params[:description]
        product.price = params[:price]
        product.group_id = params[:group_id]
        product.save
        redirect_to '/'
    end
    
    # delete group
    def delete
       product = Product.find(params[:id]) 
       product.destroy
       redirect_to '/'
    end
   
   #Show the students related with the class 
    def show

    end    
end
