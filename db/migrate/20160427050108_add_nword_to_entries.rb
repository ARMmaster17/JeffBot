class AddNwordToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :nword, :string
  end
end
