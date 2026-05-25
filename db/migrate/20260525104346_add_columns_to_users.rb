class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :login_streak, :integer, default: 0
    add_column :users, :last_login_date, :date
  end
end
