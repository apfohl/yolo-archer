class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :source

      t.timestamps
    end
    add_index :taggings, :tag_id
    add_index :taggings, :source_id
  end
end
