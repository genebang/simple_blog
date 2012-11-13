class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # around_filter :alert_redirect
  
  def alert_redirect
    begin
      yield
    rescue
      if params[:action] == "index"
        render :text => "xyz"
      else 
        # write apology to flash[:notice]
        #flash[:notice] = "I apologize for breaking"
        #redirect to index
        redirect_to article_path(@article)
      end
    end
  end
  
end
