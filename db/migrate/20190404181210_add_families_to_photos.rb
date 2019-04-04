class AddFamiliesToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_reference :photos, :family, foreign_key: true
  end
end
