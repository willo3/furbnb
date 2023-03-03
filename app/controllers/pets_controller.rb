class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = <<~SQL
        pets.name ILIKE :query
        OR pets.species ILIKE :query
        OR pets.sex ILIKE :query
      SQL
      @pets = Pet.where(sql_query, query: "%#{params[:query]}%")
      # @pets = Pet.search(params[:query])
      # SELECT * FROM pets WHERE species IN ('Rabbit', 'Duck', 'Hamster')

    else
      @pets = Pet.all
    end
  end

  def show
    set_pet
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
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
    redirect_to pets_path, status: :see_other
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :sex, :neutered, :age, :special_instructions, :photo)
  end
end
