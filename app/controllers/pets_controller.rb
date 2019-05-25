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
    puts "~~~~ pet_params ~~~~"
    puts pet_params
    puts "~~~~ creating #{pet_params[:name]} ~~~~"
    current_pet = Pet.create!({
      :name => pet_params[:name]
    })
    puts "~~~~ created #{current_pet[:name]}[id=#{current_pet[:id]}] ~~~~"
    # we should join this pet to this user
    join = Feedable.create({
      :pet_id  => current_pet[:id],
      :user_id => pet_params[:user_id]
    })
    join.save()
    flash[:info] = "Created #{current_pet[:name]}!"
    redirect_back(fallback_location: dashboard_path)
  end

  # DELETE /pets/:id
  def destroy
    pet = Pet.find_by_id pet_params[:id]
    ActiveRecord::Base.transaction do
      # get our linked pets
      links = Feedable.where("pet_id=#{pet.id}")
      links.each { |join| join.destroy }
      pet.destroy
    end
    flash[:info] = "Deleted #{pet.name}"
    redirect_back(fallback_location: dashboard_path)
  end

  private
  def pet_params
    # this looks like nesting isn't correct TODO
    params.permit(:pet, :id, :name, :animal, :dob, :user_id)
  end
end
