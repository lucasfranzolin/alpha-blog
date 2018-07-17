class ArticleCategory < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :category, optional: true
end
