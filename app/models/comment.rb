class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5}
end
