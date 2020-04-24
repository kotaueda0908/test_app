class Article < ApplicationRecord
    has_rich_text :content
    validates :title, presence: true, length: { maximum: 30 }
    belongs_to :user
    has_many :likes
    has_many :liked_users, through: :likes, source: :user

    # acts_as_taggable_on :tagのエイリアス
    acts_as_taggable

    def self.ransackable_attributes(auth_object = nil)
        %w[title created_at]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end

    scope :recent, -> { order(created_at: :desc) }
end
