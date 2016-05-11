# encoding: utf-8
Given /^我在([^\"]*)頁面$/ do |screen_name|
	action("navigate_to_#{screen_name}_screen")
end

When /^我搜尋\"([^\"]*)\"路線公車$/ do |bus|
	search_bus bus
end

When /^我藉由([^\"]*)搜尋\"([^\"]*)\"路線公車$/ do |input_type, bus|
	search_bus_by_type bus, input_type
end

Then /^我應該查不到任何\"([^\"]*)\"路線公車$/ do |bus|
	check_search_result 0
end

Transform /^路線搜尋$/ do |test|
  'search_route'
end