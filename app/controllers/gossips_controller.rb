class GossipsController < ApplicationController

  def index
  	params[:gossip_array] = Gossip.all
  end

  def new
  	
  end

  def create
  	@gossip = Gossip.new(title: params[:gossip_title],
                         content: params[:gossip_content],
                         user_id: session[:user_id])
  	if @gossip.save
  		flash.now[:success] 
  		redirect_to :action => 'index', notice: 'Thank You For Subscribing!'
  	else
  		flash.now[:alert]
  		render :new
  	end
  end

  def show
    params[:gossip] = Gossip.find(params[:id])
    @comments = Comment.all
  end

  def edit
   @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to action: "show"
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to :action => "index"
  end
end
