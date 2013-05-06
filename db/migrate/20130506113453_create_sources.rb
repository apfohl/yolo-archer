class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title
      t.string :url
      t.integer :rating, default: 0
      t.string :author
      t.string :publisher

      t.timestamps
    end
  end
end
