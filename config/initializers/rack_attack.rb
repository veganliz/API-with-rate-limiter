class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new # defaults to Rails.cache

throttle("req/ip", limit: 2, period: 10) do |req|
  req.ip
end


end
