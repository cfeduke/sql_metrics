require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test "can visualize and destroy notifications created in a request" do
    visit new_user_path
    fill_in "Name", :with => "John Doe"
    fill_in "Age", :with => "23"
    click_button "Create User"
    
    visit sql_metrics_path
    assert_match(/User Load/, page.body)
    assert_match(/INSERT INTO/, page.body)
    assert_match(/John Doe/, page.body)
    assert_match(/sql\.active_record/, page.body)
    
    assert_difference "all('table tr').count", -1 do
      click_link "Destroy"
    end
  end
end
