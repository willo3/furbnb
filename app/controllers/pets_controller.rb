class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pet = Pet.all
  end

  def show
    set_pet
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

  def edit
    set_pet
  end

  def update
    set_pet
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    set_pet
    @pet.destroy
    redirect_to pet_path(@pet), status: :see_other
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :sex, :neutered, :age, :special_instructions)
  end
end
