class DynamicPagesController < ApplicationController
  def welcome
  	params[:user] = User.find(params[:id])
  end

  def show_gossip
  	params[:gossip] = Gossip.find(params[:id])
 	end
end
