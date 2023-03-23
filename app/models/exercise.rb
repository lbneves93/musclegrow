class Exercise < ApplicationRecord
  validates_presence_of :name, :img_url
end
