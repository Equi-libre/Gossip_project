class AuthorsController < ApplicationController
  def show
  	params[:user] = User.find(params[:id])
  end
end
