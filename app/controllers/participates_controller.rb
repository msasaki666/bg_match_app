class ParticipatesController < ApplicationController
  before_action :authenticate_user!
  def create
    @participate = current_user.participates.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
      @participate = Participate.find_by(post_id: params[:post_id], user_id: current_user.id)
      @participate.destroy
    redirect_back(fallback_location: root_path)
  end
end
