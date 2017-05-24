module WorkersHelper
  def worker_options()
    Worker.all.pluck('ln, id')
  end
end
