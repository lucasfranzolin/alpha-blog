class Article < ApplicationRecord
  belongs_to :user
  # Impossibilita a criação de artigos sem título
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence:true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end
