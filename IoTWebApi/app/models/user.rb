class User < ApplicationRecord
    include ActiveSupport

  belongs_to :role ,  optional: true
  

  #only if is a new user
  after_initialize :init, unless: :persisted?

  def init
    self.role  ||= Role.find_by(name:"User")   
    self.password = Digest::SHA2.hexdigest(password)         
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
