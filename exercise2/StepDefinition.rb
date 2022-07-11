require 'selenium-webdriver'

Given('I am on the google homepage') do
    driver = Selenium::WebDriver.for :chrome
end

Given('populated the search bar with {string}') do |query|
    search_box = driver.find_element(:name, 'q')
    search_box.send_key('dijkstra algorithm')
end

When('I submit the search results') do
    search_box.submit
end

Then('The results should be equal to {string}') do |query|
    get_element(driver,:partial_link_text, 'geeksforgeeks').click
end

Given('I am on geeksforgeeks site') do |query|
    driver.action.move_to(get_element(driver,:id,'tablist1-tab1')).perform
end
