class MusicTagRelation < ApplicationRecord
  belongs_to :music
  belongs_to :tag
end
