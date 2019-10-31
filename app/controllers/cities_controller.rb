class CitiesController < ApplicationController
  def show
  	params[:cities] = City.find(params[:id])
  	
  end
end
