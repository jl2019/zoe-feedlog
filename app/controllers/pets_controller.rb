class PetsController < ApplicationController
  # GET /pets/
  def index
    @pets = Pet.all
  end

  # GET /pet/:id
  def show
    @pet = Pet.find(pet_params[:id])
  end

  # POST /pets/
  def create
    Pet.create!(pet_params)
  end


  private
  def pet_params
    # this looks like nesting isn't correct TODO
    params.permit(:pet, :id, :name, :animal, :dob)
  end
end
