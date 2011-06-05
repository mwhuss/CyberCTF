class ScoreboardController < ApplicationController
  
  def index
    @categories = Category.all(:include => [:challenges])
    @users      = User.all.sort(&:points)
  end
  
  
end