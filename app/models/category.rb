class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :transactions, dependent: :destroy

  has_one_attached :icon

  validates :user, presence: true
  validates :icon, presence: true
end
