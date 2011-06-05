class ChallengesController < ApplicationController
  
  before_filter :authenticate_user!, :only => :win
  
  def show
    @challenge = Challenge.find(params[:id])
  end
  
  
  def win
    challenge = Challenge.find(params[:id])
    flag      = params[:win][:flag]
    
    if challenge.flag == flag
      current_user.challenges << challenge
      current_user.update_attribute(:points, current_user.points + challenge.points)
      redirect_to root_path, :notice => "EPIC WIN!"
    else
      redirect_to root_path, :alert => "EPIC FAIL!"
    end
    
  end
  
end