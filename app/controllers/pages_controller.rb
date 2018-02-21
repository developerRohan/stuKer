class PagesController < ApplicationController
	before_action :authenticate_user!
  def home
  	if user_signed_in?
  		redirect_to dashboard_path
  	end
  end

  def dashboard
  	@scheduled = current_user.posts.where(state: "scheduled").paginate(:page => params[:scheduled_page], :per_page => 3).order('scheduled_at DESC')
  	@history = current_user.posts.where.not(state: 'scheduled').paginate(:page => params[:history_page], :per_page => 3).order('scheduled_at DESC')
  end

end
