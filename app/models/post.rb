class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :source


  enum status: {:published => 0, :draft => 1}

  validates :title, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :source_id, presence: true
end
