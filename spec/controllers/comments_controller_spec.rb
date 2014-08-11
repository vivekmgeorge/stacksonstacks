require 'spec_helper'

describe CommentsController do

  describe '#index' do
    it 'renders the answer page' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe '#new' do
    it 'renders the new page' do
      get :new
      expect(response).to render_template :new
    end

    it 'assigns a new Comment to @comment' do
      get :new
      expect(assigns(:comment)).to be_an_instance_of(Comment)
    end
  end

  # describe '#create' do
  #   it "creates a question with valid params" do
  #     get :create, { question: { title: "hi david", body: "OMG" }}
  #     expect(assigns(:question)).to eq(Question.last)
  #   end
  # end
end