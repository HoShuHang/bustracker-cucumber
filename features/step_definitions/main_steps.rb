# encoding: utf-8
Given /^I wait a minute$/ do
	sleep 5
end

Given /^I am on the ([^\"]*) screen$/ do |screen_name|
	action("navigate_to_#{screen_name}_screen")
end

When /^我回到首頁$/ do
  back_to_main_screen
end