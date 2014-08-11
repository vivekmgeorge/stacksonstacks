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
      question = Question.new
		  expect(question).should be_an_instance_of(Question)
    end
	end

	# context '#create' do
 # 		it "creates a question with valid params" do
 #      get :create, { question: { title: "hi david", body: "OMG" }}
 #      expect(assigns(:question)).to eq(Question.last)
 #    end
 #  end

	context '#destroy' do
    before :each do
      @delete_question = Question.create!(title: "Post", body: "Content")
    end
      it "should delete a Question" do
      expect do
          delete :destroy, id: @delete_question
      end.to change(Question, :count).by(-1)
    end
  end
end
  	# it 'deletes question' do
   #    question = Question.create!(title: "no more dishes", body: "boo!")
   #    expect{ delete :destroy, id: question.id }.to change(Question, :count).by(-1)