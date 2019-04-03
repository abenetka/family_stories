class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.references :user, foreign_key: true
      t.references :photo, foreign_key: true
      t.references :recipe, foreign_key: true
      t.references :story, foreign_key: true
    end
  end
end
