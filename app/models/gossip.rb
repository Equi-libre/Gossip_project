class Gossip < ApplicationRecord
  belongs_to :user
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :comments
  has_many :likes
  validates :title, length: {minimum: 3, maximum: 14}, presence: true
  validates :content, presence: true
end
