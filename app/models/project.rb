class Project < ActiveRecord::Base
  has_many :worker_projects, dependent: :destroy
  has_many :workers, through: :worker_projects
  accepts_nested_attributes_for :worker_projects, allow_destroy: true

  validates :name,  presence: true
  validates :start, presence: true
  validates :end,   presence: true
  validates :price, presence: true
end
