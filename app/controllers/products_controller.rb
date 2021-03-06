class ProductsController < ApplicationController
  def index
  	@products = Product.all
  	
  	respond_to do |format|
  		format.html
  		format.json { render json: @products }
  	end
  end

  def show
  	@product = Product.find(params[:id])
  	
  	respond_to do |format|
	  	format.html
	  	format.json { render json: @product }
	  end	
  end

  def new
  	@product = Product.new

  	respond_to do |format|
  		format.html
  		format.json { render json: @product }
  	end 
  end

  def create
  	@product = Product.new(params[:product])

    respond_to do |format|
    	if @product.save
    		format.html { redirect_to product_path(@product), notice: 'Product was successfully created.' }
        format.json { render json: product_path(@product), status: :created, location: @product }
    	else
    		format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity}
    	end
    end
  end

  def edit
  	@product = Product.find(params[:id])

  	respond_to do |format|
  		format.html
  		format.json { render json: @product }
  	end
  end

  def update
  	@product = Product.find(params[:id])

    respond_to do |format|
    	if @product.update_attributes(params[:product])
    		format.html { redirect_to product_path(@product), notice: 'Product was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
    		render :edit
    	end
    end
  end

	def destory
	  @product = Product.find(params[:id])
	  @product.destory

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content}
    end
	end
end