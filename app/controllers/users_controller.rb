class UsersController < ApplicationController
  def create
  	
  	user = User.new(
  		first_name: params[:first_name],
  		last_name: params[:last_name],
  		email: params[:email],
  		password: params[:password],
  		description: params[:description],
  		city_id: params[:city],
  		age: params[:age]
  		)
  	if 
  		user.save
  		flash[:success] = "Création du compte avec succès !"
  		redirect_to gossips_path
  	else
      flash.now[:alert] = 'Mauvais login'
  		render :new
  	end
  end

  def new
  end

  def show
  	user = User.find(params[:id])
  end
end
