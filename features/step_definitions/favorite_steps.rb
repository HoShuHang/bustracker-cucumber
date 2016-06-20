# encoding: utf-8
Then /^我應該可以加入\"([^\"]*)\"站牌到\"([^\"]*)\"站牌群組$/ do |stop, group|
	if group == '預設群組'
		add_to_group stop
	else
		add_to_group stop, group
	end	
end