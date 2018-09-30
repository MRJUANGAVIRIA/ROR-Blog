class Article < ApplicationRecord
  include PermissionsConcern
  has_many :has_categories , dependent: :destroy
  has_many :categories, through: :has_categories , dependent: :destroy
  #after_create :save_categories
  #after_update :save_categories
  belongs_to :user
  validates :title, uniqueness: true
  validates :title, :body, presence: true
  validates :title, length: {in: 5..25}
  validates :body, length: {minimum: 20}
  scope :last_last, -> {order("created_at DESC")} #ordena los articulos de manera descendete por la fecha de creacion
  scope :title_equal, -> {where(title: "Prueba 1")} #scope que busca el exactamente lo mismo que se le pasa por parametros
  scope :title_search, -> (title) { where("title LIKE ?", "#{title}%")} #scope que me sirve para buscar coincidencias con el titulo q le pase

  #def categories=(value)
  #  @categories = value
  #  #raise @categories.to_yaml
  #end

  #private

  #def save_categories
  #  @categories.each do |category_id|
  #    #raise "category_id #{category_id} article_id #{self.id}"
  #    HasCategory.create(category_id: category_id, article_id: self.id)
  #  end
  #end

end
