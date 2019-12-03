class Job < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory

  validates :name, presence: true,
                    length: { minimum: 5 }
  validates :subcategory_id, presence: true
  validates :cost, presence: true
  validates :description, presence: true,
                    length: { minimum: 5 }
end
