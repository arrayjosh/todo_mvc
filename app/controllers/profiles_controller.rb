class ProfilesController < ApplicationController
  before_action :require_login
  
  def show
    @user = current_user
    @lists = @user.lists
    @articles = @user.articles
  end
end
