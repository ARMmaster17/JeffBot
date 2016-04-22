class CreateEntries < ActiveRecord::Migration
  def up
    create_table :entries do |t|
  	  t.string :word
  	  t.string :definition
  	end
  end
  def down
    drop_table :entries
  end
end