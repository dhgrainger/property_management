class Addindextobuildings < ActiveRecord::Migration
  def up
    add_index :buildings, :owner_id
  end

  def down
    remove_index :buildings, :owner_id
  end
end
