require "redis"
require "yaml"

r = Redis.new
y = YAML.load_file 'data.yaml'

if !r.exists(:devices)
	puts "Loading Device List...."
	device = y['Devices']

	device.each do |d|
		r.zadd(:devices,0,d)
	end
else
	puts "Device List already up to date!!!"
end
