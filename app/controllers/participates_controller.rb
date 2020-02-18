class ParticipatesController < ApplicationController
  before_action :authenticate_user!

  def create
    @participate = current_user.participates.create(post_id: params[:post_id])
    respond_to do |format|
      format.html
      format.js
    end
    redirect_to request.referrer || root_url
  end
  
  def destroy
    @participate = Participate.find_by(post_id: params[:post_id], user_id: current_user.id)
    @participate.destroy
    respond_to do |format|
      format.html
      format.js
    end
    redirect_to request.referrer || root_url
  end
end
