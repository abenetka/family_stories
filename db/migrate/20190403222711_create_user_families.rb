class CreateUserFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_families do |t|
      t.references :user, foreign_key: true
      t.references :family, foreign_key: true
    end
  end
end