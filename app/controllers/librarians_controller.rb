class LibrariansController < ApplicationController

  before_action :authorized_librarian!

  def authorized_librarian!
    unless current_user.librarian?
      flash[:error] = 'You are not authorized to access this page'
      respond_to do |format|
        format.html do
          redirect_to dashboards_path
        end
      end
    end
  end

end
