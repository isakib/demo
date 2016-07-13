require 'capybara/cucumber'
require 'rspec/expectations'

# Capybara.default_driver = :selenium

# Capybara.app_host = "https://localhost:44300"
# Capybara.app_host = "https://preprod.splash360.com"
# Capybara.app_host = 'https://splash360.com'
Capybara.app_host = 'https://qa.splash360.com'
# Capybara.app_host = "https://www.leadspleaseplus.com/"

Capybara.run_server = true
Capybara.default_max_wait_time = 5
# Capybara.default_wait_time = 10
