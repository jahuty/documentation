require "capybara/rspec"
require "selenium-webdriver"

# Configure Capybara to use Selenium.
Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--no-sandbox')
  options.add_argument('--no-default-browser-check')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-translate')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--window-size=1024,768')

  unless ENV.fetch('HEADLESS', 'true') == 'false'
    options.add_argument('--headless')
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# Suppress Puma's start-up text in RSpec's output.
Capybara.server = :puma, { Silent: true }

Capybara.default_driver   =  :rack_test
Capybara.javascript_driver = :selenium

# Configure Capybara to load the website through rack-jekyll.
# (force_build: true) builds the site before the tests are run,
# so our tests are always running against the latest version
# of our jekyll site.
Capybara.app = Rack::Jekyll.new(force_build: true)
sleep 0.1 while Capybara.app.compiling?
