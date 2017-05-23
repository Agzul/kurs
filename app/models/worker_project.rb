class WorkerProject < ActiveRecord::Base
  belongs_to :worker
  belongs_to :project

  validates :worker,  presence: true
  validates :project, presence: true
end
