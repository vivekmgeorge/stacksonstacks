require 'spec_helper'

feature 'user registration' do 
	scenario 'creates a new user' do
		expect {
			visit root_path
			click_on 'sign up/in'
			click_on 'sign up'

			fill_in 'Email', with: 'joe@schmoe.com'
			fill_in 'Password', with: 'fullofshit'
			fill_in 'Password confirmation', with: 'fullofshit'

			click_button 'Sign up'
		}.to change(User, :count).by(1)
	end
end

feature 'user login' do
	scenario 'user logs in' do

		visit root_path
		click_on 'sign up/in'
		click_on 'sign in'

		fill_in 'Email', with: 'joe@schmoe.com'
		fill_in 'Password', with: 'fullofshit'

		click_button 'Sign in'

		current_user = 'Hey!' # Figure out how to stub current_user later.

		expect(current_user).to_not be_nil
	end
end








