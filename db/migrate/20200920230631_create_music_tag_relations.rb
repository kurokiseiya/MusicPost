class CreateMusicTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :music_tag_relations do |t|
      t.references :music, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
