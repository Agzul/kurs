class Department < ActiveRecord::Base
  has_many :workers, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
