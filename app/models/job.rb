class Job < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory

  validates :name, presence: true
  validates :subcategory_id, presence: true
  validates :cost, presence: true
  validates :description, presence: true
end
