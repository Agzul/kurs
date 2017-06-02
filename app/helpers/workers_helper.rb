module WorkersHelper
  # nested_start
  def worker_options()
    Worker.all.pluck('sn, id')
  end
  # nested_finish
end
