class Admin::ChallengesController < Admin::BaseController
  
  before_filter :find_category
    
  def new
    @challenge = @category.challenges.new
  end
  
  def show
    @challenge = @category.challenges.find(params[:id])
  end
  
  def create
    challenge = Challenge.new(params[:challenge])
    
    if @category.challenges << challenge
      redirect_to ['admin', @category], :notice => "Great success!"
    else
      flash[:alert] = "There was an error!"
      render 'new'
    end
  end
  
  private
  
    def find_category
      @category = Category.find(params[:category_id])
    end
  
end