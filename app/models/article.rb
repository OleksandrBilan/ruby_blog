class Article < ApplicationRecord
  
  include Visible
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :author_nickname, presence: true

end