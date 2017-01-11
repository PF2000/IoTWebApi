class User < ApplicationRecord
    include ActiveSupport

    validates :name, presence: { message: 'Please provide the user\'s name' }
    validates :email, presence: {message: 'Please provide the user\'s email'}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "not a valid e-mail address" }
    validates :password, presence: {message: 'Please provide the user\'s password'}, length: { minimum: 6 }
    validates :surname, presence: {message: 'Please provide the user\'s surname'}

  belongs_to :role ,  optional: true
  

  #only if is a new user
  after_initialize :init, unless: :persisted?

  def init
    if !password.nil?
      self.role  ||= Role.find_by(name:"User")   
      self.password = Digest::SHA2.hexdigest(password)         
    end
  end


  #overrides the sets
  def role=(params)
    @role = Role.find( params[:id])    
    super(@role) 
  end
  #Overrides the Gets
  def role  
    super
  end


	  # Assign an API key on create
  before_create do |user|
    user.api_key = user.generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end
end
