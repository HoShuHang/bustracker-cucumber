# encoding: utf-8
Given /^我在([^\"]*)頁面$/ do |screen_name|
	action("navigate_to_#{screen_name}_screen")
end

Transform /^路線搜尋$/ do |test|
  'search_route'
end