require 'spec_helper'

describe UsersController do

  describe '#show' do
    it 'renders the show page' do
      get :show
      expect(response).to render_template :show
    end
  end
end