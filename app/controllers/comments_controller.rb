class CommentsController < ApplicationController
  def index

  end

  def new
  end

  def create
    params[:comment] = Comment.new(content: params[:comment_content], user_id: 11)
    if params[:comment].save
      flash.now[:success] = 'Bravo tu as ajouté un commentaire au Gossip !'
       redirect_to :controller => 'gossips', :action => 'show'
    else
      flash.now[:alert] = "Loupé ! un titre, un contenu et c'est parti!"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
