class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recip.where(user_id: current_user.id)
  end
end
