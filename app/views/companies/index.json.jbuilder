json.array!(@companies) do |company|
  json.extract! company, :id, :name, :orgnr
  json.url company_url(company, format: :json)
end
