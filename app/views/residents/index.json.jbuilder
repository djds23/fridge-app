json.array!(@residents) do |resident|
  json.extract! resident, :id
  json.url resident_url(resident, format: :json)
end
