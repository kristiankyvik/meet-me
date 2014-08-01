feature "the signin process", :type => :feature do
  before :each do
    User.create(:email => 'user@example.com', :password => 'caplin555555')
  end

  scenario "signs me in" do
    visit '/locations'
    within("#login") do
      fill_in 'user_email', :with => 'user@example.com'
      fill_in 'user_password', :with =>  'caplin555555'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Logged In'
  end
end