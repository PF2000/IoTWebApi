class AddTokenCountAndLockToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :token_count, :integer
  	add_column :users, :token_limit, :integer
  	add_column :users, :token_count_reset_date, :datetime
  	add_column :users, :locked, :boolean
  end
end
