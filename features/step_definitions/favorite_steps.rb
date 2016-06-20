# encoding: utf-8
Then /^我應該可以加入\"([^\"]*)\"站牌到\"([^\"]*)\"站牌群組$/ do |stop, group|
	if group == '預設群組'
		add_to_group stop
	else
		add_to_group stop, group
	end	
end

Then /^我應該可以將該站牌的全部路線加入"預設群組"站牌群組$/ do
	add_all_to_group
end

Then /^我應該可以切換到\"([^\"]*)\"站牌群組$/ do |group|
	switch_to_group group
end

When /^我應該可以更名\"([^\"]*)\"站牌群組為\"([^\"]*)\"$/ do |group, name|
	modify_group_name group, name
end

Then /^我應該可以把\"([^\"]*)\"站牌群組設成第一個站牌群組$/ do |group|
	move_to_first_priority group
end

Then /^我應該可以刪除\"([^\"]*)\"站牌群組$/ do |group|
	delete_group group
end

Then /^我應該可以刪除\"([^\"]*)\"常用站牌$/ do |bus|
	delete_favorite_stop bus
end

Transform /^常用站牌$/ do |bus|
	'favorites'
end