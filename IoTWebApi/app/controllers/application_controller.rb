class ApplicationController < ActionController::API
	
  
	#Para serializar todos os objectos
	include ActionController::Serialization

	#Para autenticar com token 
	include ActionController::HttpAuthentication::Token::ControllerMethods
	#Swagger
  	include Swagger::Docs::ImpotentMethods

	  # Add a before_action to authenticate all requests.
	  # Move this to subclassed controllers if you only
	  # want to authenticate certain methods.


	  protected

	  # Authenticate the user with token based authentication
	  def authenticate
	    authenticate_token || render_unauthorized
	  end

	  def authenticate_token
	    authenticate_with_http_token do |token, options|
	      @current_user = User.find_by(api_key: token)
	    end
	  end

	  def render_unauthorized(realm = "Application")
	    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
	    render json: '{Bad credentials}', status: :unauthorized
	  end


  class << self
    
    Swagger::Docs::Generator::set_real_methods

    def inherited(subclass)
      super
      subclass.class_eval do
        setup_basic_api_documentation
      end
    end

    private
    def setup_basic_api_documentation
      [:index, :show, :create, :update, :delete].each do |api_action|
        swagger_api api_action do
          param :header, 'Authorization', :string, :required, 'Authentication token'
        end
      end
    end

  end

end