When(/^I select Payments tab$/) do
  step %Q{I press "Payments"}
end


Then(/^I should see payment details for "(.*?)"$/) do |filteroption|
  expect(page).to have_css '.payments__header'
  
Capybara.ignore_hidden_elements = true
 check_display_time_range(filteroption)
Capybara.ignore_hidden_elements = false

end

Then(/^I should see a filter button$/) do
  with_scope('.payments__header') do
    expect(page).to have_css '.payments__filter'
  end    
end


When(/^I click filter button$/) do
  click_button('Filter')
end


When(/^I select option "(.*?)" in the payment history filter$/) do |filteroption|
  Capybara.ignore_hidden_elements = true
  case filteroption
    when "All"      
      select_filter_radio_button('payments__filter__options__all')
   
    when "Last month"
      select_filter_radio_button('payments__filter__options__last_month')


    when "Last 6 months" 
      select_filter_radio_button('payments__filter__options__last_six_months')


    when "Last year"
      select_filter_radio_button('payments__filter__options__last_year')
      #page.execute_script("document.getElementById('payments__filter__options__last_year').click()")  
  end
   Capybara.ignore_hidden_elements = false
end


def select_filter_radio_button(radio_id)
    page.execute_script("document.getElementById('#{radio_id}').click()")  
end


def check_display_time_range(filteroption)
    Capybara.ignore_hidden_elements = true
  case filteroption
    when "All"      
      with_scope('.payments__header') do
      expect(page).to have_content 'records for the last 2 years'
    end    
    when "Last month"
     with_scope('.payments__header') do
       expect(page).to have_content 'records for the last month'
    end    
    when "Last 6 months"      
      with_scope('.payments__header') do
        expect(page).to have_content 'records for the last 6 months'
    end    
    when "Last year"
      with_scope('.payments__header') do
        expect(page).to have_content 'records for the last year'
    end  
  end  
   Capybara.ignore_hidden_elements = false
 
end


Then(/^I click "(.*?)" button if exist on payment history page$/) do |button_name|
      while page.has_css?('.payments__display-more') do
          click_button(button_name) 
      end    
end
