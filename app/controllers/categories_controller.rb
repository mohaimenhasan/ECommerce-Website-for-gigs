class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show_subcategories
    @categories = Category.where(:id => params[:id])
    @subcategories = Subcategory.all.where(:category => params[:id])
  end

end
