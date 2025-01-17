class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    @product = Product.create
    redirect_to products_path

  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory == 0
      render plain: "false"
    else
      render plain: "true"
    end
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def product_params
      params.require(:product).permit(:name, :description, :price, :inventory)
  end

end
