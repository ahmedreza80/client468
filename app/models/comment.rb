class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shop


validates :body, presence: true, allow_blank: false
end
