class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.integer :user_id
      t.string :title
      t.string :singer
      t.text :body
      t.string :youtube_url

      t.timestamps
    end
  end
end
