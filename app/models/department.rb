class Department < ActiveRecord::Base
  has_many :workers

  validates :name, presence: true
end
