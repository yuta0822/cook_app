class CooksController < ApplicationController



  def index
    @cook = Cook.all
  end

  def new
    @cook = Cook.new
  end

  def create
    @cook = Cook.create(cook_params)
    if @cook.save
       redirect_to root_path
    else
      render :new
    end
  end
  

  private
  def cook_params
    params.require(:cook).permit(:title, :catch_copy, :category_id, :cooktime_id, :material, :making, :point, :image).merge(user_id: current_user.id)
  end

end
