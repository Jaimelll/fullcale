class VisitorsController < ApplicationController

  def index
    unless  current_user.categoria then

    redirect_to  destroy_user_session_path, method: :delete
   end
  end



end
