class Music < ApplicationRecord
  belongs_to :user
  has_many :music_tag_relations, dependent: :delete_all
  has_many :tags, through: :music_tag_relations

  with_options presence: true do
    validates :title
    validates :singer
    validates :body
    validates :youtube_url
  end

end
