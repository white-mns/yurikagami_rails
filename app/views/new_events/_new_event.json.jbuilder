json.extract! new_event, :id, :result_no, :generate_no, :event, :flag, :created_at, :updated_at
json.url new_event_url(new_event, format: :json)
