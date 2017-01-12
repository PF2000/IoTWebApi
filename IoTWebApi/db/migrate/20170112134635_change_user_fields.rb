class ChangeUserFields < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :resetToken, :reset_token
  	rename_column :users, :resetDate, :rese_date
  end
end
