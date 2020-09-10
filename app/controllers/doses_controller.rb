class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @dose = @cocktail.dose
      render :new
    end
  end

  def destroy
    @dose.destroy
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:dose_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
