require_relative '../../lib/cucumber_helper'

#####
###########
#Module Switching
#####
###########
#

Given /^Go for Addressbook$/ do
  page.execute_script %Q{ $('#addressBook').click(); }
end

Given /^I click on Contacts Tab$/ do
  find(:xpath, ".//*[@id='addressBook']").click
end

Given /^I click on Action Stream Tab$/ do
  find(:xpath, ".//*[@id='dashboard']").click
end

Given /^I click on Email Tab$/ do
  find(:xpath, ".//*[@id='email']").click
end

Given /^I click on Social Tab$/ do
  find(:xpath, ".//*[@id='social']").click
end

Given /^I click on Print Tab$/ do
  find(:xpath, ".//*[@id='print']").click
end

Given /^I click on Reports Tab$/ do
  find(:xpath, ".//*[@id='campaign']").click
end

Given /^I click on Leads Tab$/ do
  find(:xpath, ".//*[@id='datawidget']").click
end
