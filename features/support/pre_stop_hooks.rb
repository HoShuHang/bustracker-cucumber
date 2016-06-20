$app_installed = false
Before do |scenario|
	before_scenario scenario
end

Before('@have_group') do |scenario|
	have_group scenario
end

After do |scenario| 
	after_scenario scenario
end