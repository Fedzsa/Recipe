class HomeController < ApplicationController
  def index
    if params.has_key?('search')
      @recipes = Recip.where("name like ?", "%#{params[:search]}%")
    elsif params.has_key?('type')
      @recipes = Recip.where(foodtype: params[:type])
    else
      @recipes = Recip.all
    end
  end

  def login
  end

  def signup
  end
end
