json.extract! item, :id, :description, :completed, :list_id, :created_at, :updated_at
json.url item_url(item, format: :json)
