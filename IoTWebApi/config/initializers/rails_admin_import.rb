RailsAdmin.config do |config|
  # REQUIRED:
  # Include the import action
  # See https://github.com/sferik/rails_admin/wiki/Actions
  config.actions do
    all
    import
  end

  config.model User do
     import do
      field :name
      field :email
      field :role_id
      field :api_key
      field :password
      field :surname
      field :token_limit
      field :locked
    end
  
end

 
end