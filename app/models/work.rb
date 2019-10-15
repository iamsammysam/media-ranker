class Work < ApplicationRecord
  has_many: votes, dependent: :nullify
  
  validates :category, presence: true
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true
  validates :description, presence: true
end


