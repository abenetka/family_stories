class CreateFamilyStories < ActiveRecord::Migration[5.2]
  def change
    create_table :family_stories do |t|
    end

    create_table :users do |t|
      t.string :name
      t.string :email
    end

    create_table :families do |t|
      t.string :name
    end

    create_table :user_families do |t|
      t.references :user, foreign_key: true
      t.references :family, foreign_key: true
    end

    create_table :recipes do |t|
      t.string :title
      t.string :ingredients
      t.string :instructions

      t.references :family, foreign_key: true
    end

    create_table :stories do |t|
      t.string :title
      t.string :content
      t.string :author

      t.references :family, foreign_key: true
    end

    create_table :photos do |t|
      t.string :image_url
      t.string :caption

      t.references :family, foreign_key: true
    end
  end
end
