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

  # context '#create' do
  #   it "creates a comment with valid params" do

  #     get :create, { comment: { body: "OMG" }}
  #     expect(assigns(:comment)).to eq(Comment.last)
  #   end
  # end

  #context '#edit' do
  #   it "edits a comment with valid params" do
  #     get :edit, { comment: { body: "OMG" }}
  #     expect(assigns(:comment)).to eq(Comment.last)
  #   end
  # end

  context '#destroy' do
    before :each do
      @delete_comment = Comment.create!(body: "Content")
    end
      it "should delete a Comment" do
      expect do
          delete :destroy, id: @delete_comment
      end.to change(Comment, :count).by(-1)
    end
  end
end