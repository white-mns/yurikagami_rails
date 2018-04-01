json.extract! current_place, :id, :result_no, :generate_no, :party_no, :place, :shop, :inn, :created_at, :updated_at
json.url current_place_url(current_place, format: :json)
