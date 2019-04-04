class AddFamiliesToStories < ActiveRecord::Migration[5.2]
  def change
    add_reference :stories, :family, foreign_key: true
  end
end
