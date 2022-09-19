class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = User.first
    if @product.save
      flash[:success] = 'Product was create successfully!'
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = 'Product updated successfully'
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :quanity, :product_type)
  end
end
