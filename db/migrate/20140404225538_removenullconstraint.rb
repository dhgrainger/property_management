class Removenullconstraint < ActiveRecord::Migration
  def up
    remove_column :buildings, :owner_id
    add_column :buildings, :owner_id, :integer
  end

  def down
    remove_column :buildings, :owner_id
    add_column :buildings, :owner_id, :integer, null: false
  end
end
