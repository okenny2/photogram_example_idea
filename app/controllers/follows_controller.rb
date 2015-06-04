class FollowsController < ApplicationController
  def index
    @follows = Follow.all
  end

  def show
    @follow = Follow.find(params[:id])
  end

  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.new
    @follow.leader_id = params[:leader_id]
    @follow.follower_id = params[:follower_id]

    if @follow.save
      redirect_to "/follows", :notice => "Follow created successfully."
    else
      render 'new'
    end
  end

  def edit
    @follow = Follow.find(params[:id])
  end

  def update
    @follow = Follow.find(params[:id])

    @follow.leader_id = params[:leader_id]
    @follow.follower_id = params[:follower_id]

    if @follow.save
      redirect_to "/follows", :notice => "Follow updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @follow = Follow.find(params[:id])

    @follow.destroy

    redirect_to "/follows", :notice => "Follow deleted."
  end
end
