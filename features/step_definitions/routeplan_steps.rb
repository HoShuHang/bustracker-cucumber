# encoding: utf-8
When /^我輸入\"([^\"]*)\"當作起點$/ do |from|
	enter_from from
end

When /^我選擇\"([^\"]*)\"做為起點$/ do |from|
	select_from from
end

When /^我輸入\"([^\"]*)\"當作終點$/ do |to|
	enter_to to
end

When /^我選擇\"([^\"]*)\"做為終點$/ do |to|
	select_to to
end

When /^我應該可以選擇\"([^\"]*)\"做為起點$/ do |from|
	select_from from
end

When /^我應該可以選擇\"([^\"]*)\"做為終點$/ do |to|
	select_to to
end

Then /^我應該可以刪除起點歷史紀錄$/ do
	delete_from_history
end

Then /^我應該可以刪除終點歷史紀錄$/ do
	delete_to_history
end

Then /^我應該可以規劃至少一條路線$/ do
	plan_route
end

Then /^我應該無法規劃路線$/ do
	plan_route_error
end

When /^我可以輸入(\d+)時(\d+)分當作規劃時間$/ do |hr, min|
	set_plan_time(hr, min)
end

When /^我可以選擇一條歷史紀錄當作起點$/ do
	navigate_to_search_start_location_screen
end

When /^我可以選擇一條歷史紀錄當作終點$/ do
	navigate_to_search_destination_screen
end

When /^我應該可以將起點與終點反轉$/ do
	switch_from_to
end

Then /^我應該可以規劃出([^\"]*)路線$/ do |transport|
	plan_transport transport
end

Then /^我應該可以規劃一條([^\"]*)$/ do |route|
	plan_routes(route)
end

Transform /^路線規劃$/ do |test|
  'route_plan'
end