require_relative '../../lib/cucumber_helper'

Given /^I am on the "(.*)" page$/ do |page|
  visit page
end

Given /^I fill in "(.*)" with "(.*)"$/ do |selector, value|
  fill_in selector, :with => value
end

Given /^I click on "(.*)" link$/ do |selector|
  click_on selector
end

Given /^I click on "(.*)" button$/ do |selector|
  click_button selector
end

Given /^I should see "([^"]*)" on screen$/ do |text|
  expect(page).to have_content text
end

When /^I wait for (\d+) seconds?$/ do |secs|
  sleep secs.to_i
end

Then /^I select checkbox$/ do
  check(find("input[type='checkbox']")[:id])
end

When /^I select "(.*)" from "(.*)" drop-down menu$/ do |selector, id|
  select(selector, :from => id)
end

When /^I click through xpath link "([^"]*)"$/ do |xpath|
  page.find(:xpath, xpath).click
end

When /^I confirm popup$/ do
  page.driver.browser.switch_to.alert.accept
end

When /^I dismiss popup$/ do
  page.driver.browser.switch_to.alert.dismiss
end

#back and forth between windows

Then /^I would focus on new window$/ do
  last_handle = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(last_handle)
end

Given /^I want to maximize the windows of browser$/ do
  page.driver.browser.manage.window.maximize
end

Given /^I want to switch between windows$/ do
  #Get the main window handle
  main = page.driver.browser.window_handles.first
  #Get the popup window handle
  popup = page.driver.browser.window_handles.last
  #Then switch control between the windows
  page.driver.browser.switch_to.window(popup)
end



#Wait for element present
When /^I wait until "([^"]*)" is visible$/ do |selector|
  find(selector, visible: true)
end

Given /^Wait until the Application is ready$/ do
  expect(page).not_to have_selector("#nprogress")
end

#Testing That Elements Do Not Exist With Capybara
# expect(page).to have_selector("#profile-photo")
# expect(page).not_to have_selector("#admin")

Given /^Element Present Verify Before Execution$/ do
  expect(page).to have_selector("#example")
end

Given /^I accept to proceed remaining scenario$/ do # Mostly active working as expectly in social post.
  page.driver.browser.switch_to.alert.accept
end

Given /^Handle Browser Popup Exceptions$/ do
  page.evaluate_script('window.confirm = function() { return true; }')
  page.click('OK')
end

Given /^Clean Browser Session$/ do
  browser = Capybara.current_session.driver.browser
  if browser.respond_to?(:clear_cookies)
    # Rack::MockSession
    browser.clear_cookies
  elsif browser.respond_to?(:manage) and browser.manage.respond_to?(:delete_all_cookies)
    # Selenium::WebDriver
    browser.manage.delete_all_cookies
  else
    raise "Don't know how to clear cookies. Weird driver?"
  end
end

Given /^Close all browser windows$/ do
  page.driver.browser.window_handles.each do |handle|
    page.driver.browser.switch_to.window(handle)
    page.execute_script "window.close()"
  end
end

Given /^Clean Browser Local Storage Session$/ do
  page.execute_script("localStorage.clear()")
end

Given /^Logged out from system$/ do
  find('.headerProfile').click
  find('#logoutForm', :text => 'Log Out').click
  end

Given /^Scroll to find contents$/ do
  page.execute_script 'window.scrollBy(0,10000)'
end

Then /^I receive a CSV file$/ do
  link_url = find_link("Report")[:href]
  file = open(link_url)
  file.content_type.should == 'application/csv'
end
