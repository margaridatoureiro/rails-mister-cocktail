# frozen_string_literal: true

# top_level_class_documentation_comment: true
class CocktailsController < ApplicationController
  before_action :fetch_cocktail, only: %i[show destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
      # or redirect_to @cocktail or redirect_to @cocktail(@cocktail.id)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def fetch_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
