class PetsController < ApplicationController
  # GET /pets/
  def index
    @pets = Pet.all
  end

  # GET /pet/
  def show
    @pet = Pet.last
  end
end
