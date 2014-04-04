class AddCompanyNametoOwners < ActiveRecord::Migration
  def up
    add_column :owners, :company, :string
  end

  def down
    remove_column :owners, :company
  end
end
