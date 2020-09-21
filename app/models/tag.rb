class Tag < ApplicationRecord
  has_many :music_tag_relations, dependent: :delete_all
  has_many :musics, through: :music_tag_relations
end
