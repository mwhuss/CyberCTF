class ScoreboardsController < ApplicationController
  
  def show
    @users = User.where(["admin = ?", false]).sort_by(&:points).reverse
  end
  
  
end