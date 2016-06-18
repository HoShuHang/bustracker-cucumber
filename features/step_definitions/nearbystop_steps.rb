# encoding: utf-8
Given /^我進入查詢地名畫面$/ do
	enter_search_location_screen
end

Then /^我應該可以查詢\"([^\"]*)\"$/ do |location|
	search_location location
end

When /^我選擇\"([^\"]*)\"$/ do |location|
	select location
end

When /^我選擇\"([^\"]*)\"站$/ do |stop|
	select_stop stop
end

Then /^我應該可以觀看公車站牌$/ do
	should_see_bus_stop
end

Then /^我應該可以觀看公車情況$/ do
	should_see_bus_status
end

Transform /^附近站牌$/ do |bus|
	'nearbystop'
end