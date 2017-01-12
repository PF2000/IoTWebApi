class RailsAdminCustomController < ApplicationController
  # RailsAdmin support
  include AbstractController::Helpers
  include ActionController::Flash
  include ActionController::RequestForgeryProtection
  include ActionController::MimeResponds
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionView::Layouts
  include ActionView::Helpers::TranslationHelper
  
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
end
