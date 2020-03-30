# frozen_string_literal: true

# top_level_class_documentation_comment: true
class DosesController < ApplicationController
  before_action :fetch_cocktail, only: %i[new create]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    fetch_dose
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def fetch_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def fetch_dose
    @dose = Dose.find(params[:id])
  end
end
