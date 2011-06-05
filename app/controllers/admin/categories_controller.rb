class Admin::CategoriesController < Admin::BaseController
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def create
    category = Category.new(params[:category])
    
    if category.save
      redirect_to ['admin', category], :notice => "Great success!"
    else
      flash[:alert] = "There was an error!"
      render 'new'
    end
  end
  
  
end