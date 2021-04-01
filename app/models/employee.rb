class Employee < ApplicationRecord
  belongs_to :user, optional: true
  has_many :batteries
  validates_presence_of :first_name, :last_name, :title, :email
end
