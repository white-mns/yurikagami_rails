json.extract! new_place, :id, :result_no, :generate_no, :place_id, :created_at, :updated_at
json.url new_place_url(new_place, format: :json)
