json.extract! profile, :id, :result_no, :generate_no, :e_no, :sub_no, :nickname, :title, :job, :sex, :age, :height, :weight, :created_at, :updated_at
json.url profile_url(profile, format: :json)
