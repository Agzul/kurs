class WorkerProject < ActiveRecord::Base
  belongs_to :worker
  belongs_to :project
end
