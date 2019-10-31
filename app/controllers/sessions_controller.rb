class SessionsController < ApplicationController
  def create
  	@user = User.find_by(email: params[:email])
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		flash[:sucess] = "Connexion réussie"
  		redirect_to "/"
  		puts "auth réussi bro"
  	else
  		flash.now[:danger] = "Informations invalides"
  		render :new
  	end
  end


  def new
  end

  def destroy
  	session.delete(:user_id)
  	flash[:success] = "Déconnexion réussi"
  	redirect_to root_path
  end
end
