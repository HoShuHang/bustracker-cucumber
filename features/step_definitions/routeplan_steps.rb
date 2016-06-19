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

Then /^我應該可以規劃至少一條路線$/ do
	plan_route
end

Transform /^路線規劃$/ do |test|
  'route_plan'
end