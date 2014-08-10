require 'spec_helper' 

describe QuestionsController do

	describe '#index' do 
		it 'renders the index page' do
			get :index
			expect(response).to render_template :index
		end
	end

	describe '#new' do
		it 'renders the new page' do
			get :new
			expect(response).to render_template :new
		end

		it 'assigns a new Question to @question' do
			get :new
			expect(assigns(:question)).to be_an_instance_of(Question)
		end
	end


end