class Article < ApplicationRecord
    include PermissionsConcern
    has_many :has_categories , dependent: :destroy
    has_many :categories, through: :has_categories , dependent: :destroy
    after_create :save_categories
    belongs_to :user
    validates :title, uniqueness: true
    validates :title, :body, presence: true
    validates :title, length: {in: 5..25}
    validates :body, length: {minimum: 20}
    def categories=(value)
        @categories = value
        #raise @categories.to_yaml
    end
    private
    def save_categories
        @categories.each do |category_id|
            #raise "category_id #{category_id} article_id #{self.id}"
            HasCategory.create(category_id: category_id, article_id: self.id)
        end
    end
end
