json.extract! response, :id, :complaint_id_id, :user_id_id, :tanggapan, :tanggal, :created_at, :updated_at
json.url response_url(response, format: :json)
