require_relative '../../lib/cucumber_helper'

Given /^I create an activity with "([^"]*)" in Details View$/ do |user_input|
  find('.addEvent').click
  find(:xpath, "//*[@placeholder = 'What action is next?']").set "#{user_input}"
end

Given /^I select activity type "([^"]*)"$/ do |activity_type|
  find('.selTxt').click
  find('.easy-list-item', :text => activity_type).click
end

Given /^I click to Save button$/ do
  find('.red').click
end


Given /^I move to next contact address$/ do
  find('#nextLink').click
end

Given /^I move to previous contact address$/ do
  find('#nextLink').click
end