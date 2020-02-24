class Article < ApplicationRecord
    has_rich_text :content
    validates :title, presence: true, length: { maximum: 30 }
    belongs_to :user
end
