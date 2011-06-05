class ScoreboardsController < ApplicationController
  
  def show
    @users      = User.all.sort(&:points)
  end
  
  
end