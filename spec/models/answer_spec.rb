require 'spec_helper'

describe AnswersController do

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
      answer = Answer.new
      expect(answer).should be_an_instance_of(Answer)
    end
  end

  # context '#create' do
 #    it "creates a answer with valid params" do
 #      get :create, { answer: { title: body: "OMG" }}
 #      expect(assigns(:answer)).to eq(Answer.last)
 #    end
 #  end

  context '#destroy' do
    before :each do
      @delete_answer = Answer.create!(body: "Content")
    end
      it "should delete a Answer" do
      expect do
          delete :destroy, id: @delete_answer
      end.to change(Answer, :count).by(-1)
    end
  end
end