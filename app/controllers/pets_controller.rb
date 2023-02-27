class PetsController < ApplicationController
  def index
    @pet = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to @pet, notice: "Pet was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :sex, :neutered, :age, :special_instructions)
  end
end
