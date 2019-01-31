class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.boolean :release
      t.integer :release_year
      t.string :artist_name
      t.string :genre
    end
  end
end
