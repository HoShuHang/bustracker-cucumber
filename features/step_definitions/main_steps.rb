# encoding: utf-8
Given /^I wait a minute$/ do
	sleep 5
end

Given /^I am on the ([^\"]*) screen$/ do |screen_name|
	p "screen_name = #{screen_name}"
	action("navigate_to_#{screen_name}_screen")
end