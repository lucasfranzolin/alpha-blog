class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :article_categories
  has_many :categories, through: :article_categories
  # Impossibilita a criação de artigos sem título
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence:true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end
