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

When /^我進入選擇目的站牌畫面$/ do
	enter_select_destination_screen
end

When /^我應該可以輸入目的站牌\"([^\"]*)\"$/ do |stop|
	search_destination stop
end

Then /^我應該可以取消查詢地名$/ do
	cancel_search
end

When /^我選擇\"([^\"]*)\"當作目的站牌$/ do |stop|
	select_destination stop
end

Then /^我應該可以看到\"([^\"]*)\"被加進歷史紀錄中$/ do |location|
	should_see_location_in_search_location_history location
end

Transform /^附近站牌$/ do |bus|
	'nearbystop'
end