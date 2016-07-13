require_relative '../../lib/cucumber_helper'

When /^As Admin User, Nav "([^"]*)" and "([^"]*)"$/ do |username, password| #Username: dashboard in production
  steps '
    When I am on the "/Account/Login" page
    And I fill in "username" with "razorfish"
    And I fill in "password" with "123456"
    And I click on "Login" button
  '
end