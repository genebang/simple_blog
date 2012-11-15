class AddUserRole < ActiveRecord::Migration
  def up
    add_column :users, :role, :string, :default => "admin"
  end

  def down
    remove_column :users, :role
  end
end
