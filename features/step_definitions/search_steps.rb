# encoding: utf-8
Given /^我在([^\"]*)頁面$/ do |screen_name|
	action("navigate_to_#{screen_name}_screen")
end

When /^我搜尋\"([^\"]*)\"路線公車$/ do |bus|
	search_bus_by_type bus
end

When /^我藉由([^\"]*)搜尋\"([^\"]*)\"路線公車$/ do |input_type, bus|
	search_bus_by_type bus, input_type
end

When /^我輸入\"([^\"]*)\"路線公車$/ do |bus|
	enter_in_search_bar bus
end

Then /^我應該查不到任何\"([^\"]*)\"路線公車$/ do |bus|
	check_search_result 0
end

When /^我進入路線公車頁面$/ do
	enter_search_result 0
end

Then /^我應該可以查到([^\"]*)筆\"([^\"]*)\"路線公車$/ do |count, bus|
	check_search_result count.to_i
end

Then /^我應該可以看到([^\"]*)到站狀況$/ do |bus|
	action("should_see_#{bus}_status")
end

Then /^我應該可以重設路線搜尋$/ do
	reset_search_route
end

Then /^我應該可以更改搜尋路線$/ do
	modify_search_route
end

Then /^我應該可以取消輸入$/ do
	cancel_input
end

Transform /^路線搜尋$/ do |test|
  'search_route'
end

Transform /^去程公車$/ do |bus|
	'outbound_bus'
end

Transform /^回程公車$/ do |bus|
	'inbound_bus'
end

Transform /^藍$/ do |bus|
	'BL'
end