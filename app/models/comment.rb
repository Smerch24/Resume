class Comment < ApplicationRecord
  belongs_to :page
  validates :author, presence: true
  validates :content, presence: true
end
