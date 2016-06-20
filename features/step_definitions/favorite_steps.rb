# encoding: utf-8
Then /^我應該可以加入\"([^\"]*)\"站牌到\"([^\"]*)\"站牌群組$/ do |stop, group|
	add_to_group stop
end