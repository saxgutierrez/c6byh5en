module Api
    module V1
        class ProductsController < ApplicationController
            protect_from_forgery with: :null_session
            skip_before_action :verify_authenticity_token
        	
        	def index
        	  @products = Product.all
              render json: @products
        	end

            def new
              @product = Product.new
            end
            
        	def create
              @product = Product.new(product_params)
              if @product.save
              render json: @product, status: 201
        	  else
              render json: {errors: @product.errors}, status: 422
              end
        	end

        	#def edit
        	 # @product = Product.find(params[:id])
        	#end

        	def update
              @product = Product.find(params[:id])
        	  if @product.update(product_params)
              render json: @product, status: 200
              else
              render json: {errors: @product.errors}, status: 422
              end
        	end

            def destroy
               @product = Product.find(params[:id])
               if @product.destroy
               render json: @product, status: 204
               else
               head :no_content
               end
            end

        	private
        	  def product_params
        	    params.require(:product).permit(:name, :price)
        	  end

        end
    end
end