class Article < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true

    has_rich_text :body
end
