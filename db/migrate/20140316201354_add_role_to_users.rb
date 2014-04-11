class AddRoleToUsers < ActiveRecord::Migration
  def change
  add_column :users, :role, :string
  #  reversible do |dir|
  #    change_table :users do |t|
  #      dir.up   { t.change :role, :string }
  #      dir.down { t.change :role, :string }
  #    end
  #  end
  end
end
