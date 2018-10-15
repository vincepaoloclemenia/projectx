class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to main_app.root_url, :alert => exception.message
    end
    
    #before_action :set_root_paths, if: proc { |g| g.controller_name == "pages" }


    protected

        def set_root_paths
            
        end
end
