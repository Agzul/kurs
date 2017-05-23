json.extract! project, :id, :name, :start, :end, :price, :created_at, :updated_at
json.url project_url(project, format: :json)
