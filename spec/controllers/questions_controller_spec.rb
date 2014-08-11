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

		it 'creates a new instance' do
			expect(assigns(:question)).to eq(Question.last)
		end
		it 'assigns a new Question to @question' do
			get :new
			expect(assigns(:question)).to be_an_instance_of(Question)
		end
	end

	describe '#create' do
 		it "creates a question with valid params" do
      get :create, { question: { title: "hi david", body: "OMG" }}
      expect(assigns(:question)).to eq(Question.last)
    end
  end

	context "#destroy" do
  	it "#deletes post" do
      question = Question.create!(title: "no more dishes", content: "boo!")
      expect{ delete :destroy, id: question.id }.to change(Question, :count).by(-1)
    end
  end
end