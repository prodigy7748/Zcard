class Post < ApplicationRecord
  belongs_to :board
  belongs_to :user
  has_many :comments
  has_many :favorite_posts
  #慣例使用users，但favorite_users語意較清楚
  has_many :favorite_users, through: :favorite_posts, source: 'user'

  validates :title, presence: true
  validates :content, presence: true

  def owned_by?(user)
    self.user == user
  end
end
