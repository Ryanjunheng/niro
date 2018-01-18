class ChangeColumnInUsers < ActiveRecord::Migration[5.1]
  def up
  	change_column_null :users, :email, true
  end

  def down
  	change_column_null :users, :email, false
  end
end
