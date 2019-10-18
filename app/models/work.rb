class Work < ApplicationRecord
  has_many :votes, dependent: :nullify
  
  validates :category, presence: true
  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publication_year, presence: true
  validates :description, presence: true
  
  
  def self.sort_by_category(category)
    self.where(category: category)
  end
  
  def self.find_work
    driver = Driver.find_by(available: true)
    return driver.id
    
    if driver == nil
      head :not_found
      return
    else 
      return driver.id
    end
  end
  
  
end

