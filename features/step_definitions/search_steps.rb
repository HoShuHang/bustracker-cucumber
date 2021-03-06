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

When /^我選擇\"([^\"]*)\"站牌$/ do |stop|
	select_stop stop
end

Then /^我應該可以觀看公車詳細資訊$/ do
	watch_info
end

When /^我回到路線公車頁面$/ do
	from_route_info_screen_back_to_realtime_bus_information_screen
end

Then /^我應該可以選擇觀看公車詳細資訊$/ do
	select_watch_info
end

Then /^我應該看不到搜尋過的畫面$/ do
	check_search_empty
end

Then /^我應該可以查詢經過\"([^\"]*)\"的所有路線$/ do |stop|
	search_all_pass_by stop
end

Then /^我應該可以查看公車路線地圖$/ do
	watch_bus_map
end

Then /^我應該可以查到所有\"([^\"]*)\"路線公車$/ do |bus|
	check_search_route_result bus
end

Then /^我應該可以設定上車提醒$/ do
	set_get_on_alarm
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