# encoding: utf-8
Given /^我在([^\"]*)頁面$/ do |screen_name|
	action("navigate_to_#{screen_name}_screen")
end

When /^我搜尋\"([^\"]*)\"路線公車$/ do |bus|
	search_bus bus
end

Transform /^路線搜尋$/ do |test|
  'search_route'
end