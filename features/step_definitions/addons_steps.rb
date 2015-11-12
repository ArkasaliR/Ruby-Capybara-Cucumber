require 'pry'

When (/^I navigate to the My addons page$/) do
  step %Q(I navigate to the Account Settings page)
  step %Q(I follow "#{I18n.t('account_settings.index.service.manage_add_ons')}")
  sleep 0.2
end

Then (/^I should see My Add-ons page title$/) do
  step %Q(I should see page title as "#{I18n.t('addons.addons.addons.title')}")
  expect(page).to have_content "#{I18n.t('addons.addons.addons.detail')}"
end

Then (/^I should see (.*?) family group$/) do |family_group|
  page.assert_selector(:xpath, "//div[contains(@class, 'add-ons__category__content')]//h2[text() = '#{family_group}']")
        if (family_group == 'Data')
          find('#ng-app').should have_content I18n.t('addons.addons.addons.category_detail.data')
        end
        if(family_group == 'Talk and TXT')
           find('#ng-app').should have_content I18n.t('addons.addons.addons.category_detail.talk_and_txt')
        end
        if(family_group == 'International Direct Dial')
          find('#ng-app').should have_content I18n.t('addons.addons.addons.category_detail.international_calls')
        end
end

Then (/^I should see Monthly (.*?) addon title$/) do |family_group|
  step %Q{I wait 2 seconds}
  if (family_group=="Data")
    addon_title = I18n.t('addons.addons.products.addons_title.data', category: family_group)
  else if (family_group=="International calls")
    addon_title = I18n.t('addons.addons.products.addons_title.international_calls', category: family_group)
  else if (family_group=="Talk and TXT")
    addon_title = I18n.t('addons.addons.products.addons_title.talk_and_txt', category: family_group)
    end
  end
end

  page.assert_selector('h3', text: addon_title)
end

Then (/^I should see Monthly (.*?) addons$/) do |family_group|   #//section[contains(@id,'#{family_group}_addons')]
  page.assert_selector(:xpath, "//ol[contains(@class, 'addons_carousel__products')]")
  page.all(:xpath, "//ol[contains(@class, 'addons_carousel__products')]").count.should be > 0
end

Then (/^I should see following Data addons$/) do |table|
  results = []  
  all('li.addons_carousel__product').each do |a|
   results << a.text
  end
  navigate_through_add_on_carousel
  all('li.addons_carousel__product').each do |a|
    results << a.text
  end
  results.uniq!.delete("")
  expected_addons =[]
  table.hashes.each do |row|
   expected_addons << row['Addons']
  end
  expect(results == expected_addons) == true
end

def navigate_through_add_on_carousel
  within ".add-ons__category__carousel" do
    begin
      while page.find('div.addons_carousel__right-button').visible? do
        page.find("div.addons_carousel__right-button").click
        step %Q{I wait 2 seconds}
      end
    rescue
    end
  end
end

Then (/^I should see One\-off (.*?) booster title$/) do |family_group|
  if (family_group == "Talk and TXT") 
    addon_title = I18n.t('addons.addons.products.boosters_title.talk_and_txt', category: family_group)  
  else if (family_group == "Data")
    addon_title = I18n.t('addons.addons.products.boosters_title.data', category: family_group)  
    end
  end  
  page.assert_selector('h3', text: addon_title)
end

Then(/^I should see One\-off International calls boosters title$/) do
   addon_title = I18n.t('addons.addons.products.boosters_title.data', category: "International calls")
  page.assert_selector('h3', text: addon_title)
end


And (/^I click to view (.*?) boosters$/) do |family_group|
  addon_title = I18n.t('addons.addons.products.boosters_title.data', category: family_group)
  page.find('h3', text: addon_title).click
end

Then (/^I should see One-off (.*?) boosters$/) do |family_group|
 page.should have_css ('.addons_carousel__product')
end

And(/^I select Add (.*?)$/) do |family_group|
  category_link = page.find('.add-ons__category-change__link', text: "Add #{family_group}", visible: true)
  raise "Cannot find category" unless category_link
  category_link.click
end

When(/^I select Change (.*?) Add\-on$/) do |family_group|
   if (family_group=="IDD")
      family_group="International calls"
   end
   within('.add-ons__category__content', text: "#{family_group}") do
      click_link ('Change or remove Add-on')
  end
end

Then (/^I am directed to My addons page$/) do
  step %Q(I should see page title as "#{I18n.t('addons.addons.addons.title')}")
end

And (/^I select a (.*?) addon$/) do |family_group|
  page.assert_selector(:xpath, "//section[contains(@id,'#{trim(family_group)}_addons')]//*[contains(@class, 'add-ons__category__carousel')]", visible: true)
  addons = page.all(:xpath, "//section[contains(@id,'#{trim(family_group)}_addons')]//*[contains(@class, 'add-ons__category__carousel')]//*[contains(@class, 'addons_carousel__product__content')]")
  addons.first.click
end

And (/^I select a (.*?) booster$/) do |family_group|
  page.assert_selector(:xpath, "//section[contains(@id,'#{trim(family_group)}_boosters')]//*[contains(@class, 'addons_carousel__products')]", visible: true)
  boosters = page.all(:xpath, "//section[contains(@id,'#{trim(family_group)}_boosters')]//*[contains(@class, 'addons_carousel__products')]//*[contains(@class, 'addons_carousel__product__content')]")
  boosters.first.click
end

And (/^I select to purchase (.*?) One-off Data booster$/) do |booster_name|
  page.assert_selector(:xpath, "//section[contains(@id,'Data_boosters')]//*[contains(@class, 'addons_carousel__products')]", visible: true)
  boosters = page.all(:xpath, "//section[contains(@id,'Data_boosters')]//*[contains(@class, 'addons_carousel__products')]//*[contains(@class, 'addons_carousel__product__content')]")
    booster_name=booster_name.trim('/\W/')
    boosters.each do |booster|
      booster.find('.addons_carousel__product__details').text.contains(booster_name)
      booster.click
    end 
end

And (/^I follow Buy (.*?) link$/) do |addon_type|
  page.find("#buy-#{addon_type}").click
end

Then (/^I should see Review addon page title$/) do
  step %Q(I should see page title as "#{I18n.t('addons.addons.review_product.title')}")
end

Then (/^I should see Review addon page details$/) do
  features_header = I18n.t('addons.addons.review_product.features')
  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__review-product__product-summary')]//*[contains(text(), '#{I18n.t('addons.addons.review_product.sub_section')}')]")
  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__review-product__product-summary')]//*[contains(@class, 'addons_product__summary')]")
  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__review-product__features')]//*[contains(text(), '#{features_header}')]")
  page.all(:xpath, "//*[contains(@class, 'add-ons__review-product__features')]//*[contains(@class, 'spl-default-list')]//li").count.should be > 0
  page.assert_selector('.add-ons__review-product__termns-n-conditions__title')
end

Then (/^I should see Review "(.*?)" addon page details$/) do |addons_detail|
  confirmation_text = 'The order will appear on your next invoice.'
  sub_section_text = I18n.t('addons.addons.review_product.sub_section')
  features_header = I18n.t('addons.addons.review_product.features')

  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__review-product__product-summary')]//*[contains(text(), '#{sub_section_text}')]")
  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__review-product__product-summary')]//*[contains(@class, 'addons_product__summary')]")
  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__review-product__features')]//*[contains(text(), '#{features_header}')]")
  expect(page.all(:xpath, "//*[contains(@class, 'add-ons__review-product__features')]//*[contains(@class, 'spl-default-list')]//li").count).to be > 0
  #page.assert_selector('.add-ons__review-product__termns-n-conditions__title')
  page.assert_selector('#add-ons__terms-and-conditions-label')
end

Then (/^I should see modify_addon "(.*?)" review page details$/) do |addons_detail|
 
  sub_section_text = I18n.t('addons.addons.review_product.sub_section')
  features_header = I18n.t('addons.addons.review_product.features')
   
  entire_confirmation_text = sub_section_text + " "+ addons_detail
  page.should have_content(entire_confirmation_text)
  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__review-product__features')]//*[contains(text(), '#{features_header}')]")
  expect(page.all(:xpath, "//*[contains(@class, 'add-ons__review-product__features')]//*[contains(@class, 'spl-default-list')]//li").count).to be > 0
  page.assert_selector('.add-ons__review-product__termns-n-conditions__title')
  page.assert_selector('.add-ons__review-product__termns-n-conditions-checkbox')
end

And (/^I am directed to (.*?) addons and boosters details page$/) do |family_group|
  page.should have_css ('.add-ons__container')
end

Then (/^I select my child account$/) do
  current_service_number = page.find(:xpath, "//select[contains(@id, 'service_id')]//option[contains(@selected, 'selected')]")['value']
  child_service_option = page.all(:xpath, "//select[contains(@id, 'service_id')]//option[@value !='#{current_service_number}']").first
  @child_service_number = child_service_option['value']

  step %Q{I select "#{child_service_option.text}" from "service_id"}
end

And (/^I should see My Add-ons page details for my child account$/) do
  current_path.should include("/services/#{@child_service_number}/addons")
  step %Q(I should see page title as "#{I18n.t('addons.addons.addons.title')}")
end

And (/^I am directed to My Add-ons page for my child account$/) do
  step %Q(I should see My Add-ons page details for my child account)
end

And (/^I select a (.*?) add-on to purchase$/) do |family_group|
  step %Q(I select a #{family_group} addon)
  step %Q(I follow Buy addon link)
end
And (/^I select a (.*?) booster to purchase$/) do |family_group|
  step %Q(I select a #{family_group} booster)
  step %Q(I follow Buy booster link)
end

And (/^I Agree to the terms and conditions$/) do
  page.find('#add-ons__terms-and-conditions-label').click
end

Then (/^I am directed to Processing order details page$/) do
  step %Q(I should see page title as "#{I18n.t('addons.addons.purchased_product.title')}")
end

Then (/^I should see Processing order details$/) do
  confirmation_text = I18n.t('addons.addons.purchased_product.confirmation')
  next_steps_title = I18n.t('addons.addons.purchased_product.next_steps_title')
  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__confirmation__box') and contains(text(), '#{confirmation_text}')]")
  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__purchased_product__summary')]//*[contains(text(), 'You have purchased the')]")
  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__purchased_product__summary')]//*[contains(@class, 'addons_product__summary')]")
  page.assert_selector(:xpath, "//*[contains(@class, 'add-ons__purchased_product__next-steps')]//*contains(text(), '#{next_steps_title}')]")
  page.all(:xpath, "//*[contains(@class, 'add-ons__purchased_product__next-steps')]//*contains(text(), '#{next_steps_title}')]//ol//li").count.should be > 0
end

And (/^I select Back to My Usage link$/) do
  page.find('#add-ons-back-to-my-usage').click
end

And (/^I am directed to My usage page$/) do
  step %Q(I should see page title as "#{I18n.t('home.index.title')}")
end

Then (/^I should see my current purchased (.*?) addon$/) do |family_group|
  within('.add-ons__category__content', text: "#{family_group}") do
    page.should have_css('.addons_product__summary')
    page.should have_css('.addons_product__cost__figure')
    page.should have_css('.addons_product__inclusions')
  end
end
Then (/^I will see the active (.*?) add on currently associated with my service$/) do |family_group|
  category = page.find(:xpath, "//*[contains(@class, 'add-ons__category__content') and descendant::*[text()='#{family_group}']]")
  category.find('.addons_product__summary')
  category.find('.addons_product__cost__figure').text.should eql('5')
  category.find('.addons_product__inclusions').text.should eql('50 mins')
end

When(/^I select the my "(.*?)" add\-on to (.*?)$/) do |addon_name, change_or_buy|
  page.assert_selector(:css, '.addons_carousel__product')
  addons_all = page.all(:css, '.addons_carousel__product')

    addons_all.each do |addons|
      new_addon = addons.find('.addons_carousel__product__details').text
      
      if (new_addon == addon_name)
        addons.find('.addons_carousel__product__details').click
      end
    end

    if change_or_buy == "purchase"
      page.find('#buy-addon').click
    else
      page.find('#change-addon').click
    end
end

When(/^I select the my "(.*?)" booster to (.*?)$/) do |booster_name, change_or_buy|

  page.assert_selector(:css, '.addons_carousel__product')
  booster_all = page.all(:css, '.addons_carousel__product')

    booster_all.each do |booster|
      new_booster = booster.find('.addons_carousel__product__details').text
      if (new_booster == booster_name)
        booster.find('.addons_carousel__product__details').click
      end
    end

    if change_or_buy == "purchase"
      page.find('#buy-booster').click
    else
      page.find('#change-booster').click
    end
end

And (/^I select a (.*?) add-on to modify$/) do |family_group|
  page.assert_selector(:xpath, "//section[contains(@id,'#{trim(family_group)}_addons')]//*[contains(@class, 'add-ons__category__carousel')]", visible: true)
  addons = page.all(:xpath, "//section[contains(@id,'#{trim(family_group)}_addons')]//*[contains(@class, 'add-ons__category__carousel')]//*[contains(@class, 'addons_carousel__product__content')]")
  addons.first.click
end

 And (/^I select to click on Change to this addon link$/) do
   page.find('#change-addon').click
end

And (/^I select Remove addon link$/) do
  page.find('#cancel-addon').click
end

Then (/^I should see Remove (.*?) add-on page title$/) do |family_group|
  step %Q(I should see page title as "#{I18n.t('addons.addons.cancel_addon.title', category: family_group)}")
end

Then (/^I should see Remove add-on page details$/) do
  step %Q(I should see page title as "#{I18n.t('addons.addons.products.remove_addon')}")
  step %Q(I should see "#{I18n.t('addons.addons.cancel_addon.sub_title')}")
  step %Q(I should see "#{I18n.t('addons.addons.cancel_addon.confirm')}")
  step %Q(I should see "#{I18n.t('addons.addons.cancel_addon.cancel')}")
  expect(page).to have_css('.addons_product__summary')
  expect(page).to have_css('.addons_product__summary .addons_product__cost')
  expect(page).to have_css('.addons_product__summary .addons_product__inclusions')
end

def trim(family_group)
  family_group.downcase.gsub(/[^a-z_0-9]/, '_')
end

And(/^I press the cancel button$/) do
  step %Q{I press by id "cancel-purchase-addon"}
end

 
And(/^I follow Cancel from (.*?) page$/) do |page|
  if (page=="Data addons")
    step %Q{I follow "Cancel" within "#data_addons"}
  elsif (page=="Data boosters")
    step %Q{I follow "Cancel" within "#data_boosters"}
  elsif (page=="Idd addons")
    step %Q{I follow "Cancel" within "#idd_addons"}
  end
end
