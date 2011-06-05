class ChallengesController < ApplicationController
  
  before_filter :authenticate_user!, :only => :win
  
  def index
    @categories = Category.all(:include => [:challenges => [:users, :wins]])
  end
  
  def show
    @challenge = Challenge.find(params[:id])
  end
  
  def win
    challenge = Challenge.find(params[:id])
    flag      = params[:win][:flag]
    
    if current_user.challenges.include?(challenge)
      redirect_to challenges_path, :alert => "You've already got that one, get back to work!"
    elsif challenge.flag == flag
      current_user.challenges << challenge
      current_user.update_attribute(:points, current_user.points + challenge.points)
      redirect_to challenges_path, :notice => "BOOM GOES THE DYNAMITE! Awarded #{challenge.points} points."
    else
      redirect_to challenge, :alert => "EPIC FAIL!"
    end
    
  end
  
end