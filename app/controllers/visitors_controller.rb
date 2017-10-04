class VisitorsController < ApplicationController

  def index
    if current_user.id==4 then

    redirect_to  destroy_user_session_path, method: :delete
   end
  end



end
