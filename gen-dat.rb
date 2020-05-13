require 'json'

f = File.open 'stores.json'

stores = JSON.parse f.read
fo = File.open 'stores.dat', 'w'

stores['data'].each do |store|
  fo.write "#{store['id']}: #{store['attributes']['name']}, #{store['attributes']['city']}, #{store['attributes']['website_url']}\n"
end

fo.close
