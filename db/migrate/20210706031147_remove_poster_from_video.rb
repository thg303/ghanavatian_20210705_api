class RemovePosterFromVideo < ActiveRecord::Migration[6.1]
  def up
    remove_column :videos, :poster, :string
  end

  def down
    add_column :videos, :poster, :string
  end
end
