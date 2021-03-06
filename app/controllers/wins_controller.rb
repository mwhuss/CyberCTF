class WinsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    challenge = Challenge.find(params[:challenge_id])
    flag      = params[:flag]
    
    if challenge.flag == flag
      current_user.challenges << challenge
      current_user.calculate_score!
      redirect_to scoreboard_path, :notice => "EPIC WIN!"
    else
      redirect_to scoreboard_path, :alert => "EPIC FAIL!"
    end
  end
  
end