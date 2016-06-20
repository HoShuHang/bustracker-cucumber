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
	select_nearbystop stop
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

Then /^我應該可以刪除歷史紀錄$/ do
	delete_search_location_history
end

Then /^我應該可以刪除目的站牌歷史紀錄$/ do
	delete_destination_history
end

Then /^我應該可以取消輸入目的站牌$/ do
	cancel_search_destination
end

Then /^我應該可以不設站牌並返回$/ do
	no_destination
end

Then /^我應該可以看到\"([^\"]*)\"在目的站牌歷史紀錄中$/ do |destination|
	should_see_destination_in_select_destination_history destination
end

Transform /^附近站牌$/ do |bus|
	'nearbystop'
end