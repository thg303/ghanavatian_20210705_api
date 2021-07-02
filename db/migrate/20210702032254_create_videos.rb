class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.references :category, null: false, foreign_key: true
      t.string :clip
      t.string :poster

      t.timestamps
    end
  end
end
