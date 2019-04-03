class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image_url
      t.string :caption

      t.references :family, foreign_key: true
    end
  end
end
