class Contact < ApplicationRecord
  validates :title, :description, :email, presence: true
  validates :title, length: {in:5..20}
  validates :description, length: {in:5..20}
end
