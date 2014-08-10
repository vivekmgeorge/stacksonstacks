require 'spec_helper'

def sign_in
	visit root_path
	click_on 'sign up/in'
	click_on 'sign up'

	fill_in 'Email', with: 'joe@schmoe.com'
	fill_in 'Password', with: 'fullofshit'
	fill_in 'Password confirmation', with: 'fullofshit'
end

feature 'questions' do
	scenario 'create a question' do
		sign_in
		visit new_question_path
		fill_in 'Title', with: 'Sample Title'
		fill_in 'Body', with: 'Sample Body'
		expect { click_on 'Create Question' }.to change { Question.count }.by 1
	end

	scenario 'delete a question' do
		sign_in
		visit new_question_path
		fill_in 'Title', with: 'Sample Title'
		fill_in 'Body', with: 'Sample Body'
		click_on 'Create Question'
		expect { click_on 'delete question' }.to change { Question.count }.by -1
	end

	scenario 'upvote a question' do
		sign_in
		visit new_question_path
		fill_in 'Title', with: 'Sample Title'
		fill_in 'Body', with: 'Sample Body'
		click_on 'Create Question'
		click_on 'Upvote' # Only tests the existence of an upvote button
	end

	scenario 'downvote a question' do
		sign_in
		visit new_question_path
		fill_in 'Title', with: 'Sample Title'
		fill_in 'Body', with: 'Sample Body'
		click_on 'Create Question'
		click_on 'Downvote'
	end
end