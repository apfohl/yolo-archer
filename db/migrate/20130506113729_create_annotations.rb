class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.text :content
      t.integer :rating, default: 0
      t.integer :source_id

      t.timestamps
    end
  end
end
