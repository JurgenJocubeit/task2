require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  context 'when welcome params are blank' do
    it 'sets @cronuts to the default value' do
      get :index

      expect(assigns(:cronuts_url)).to eq 'https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg'
    end

    it 'sets @donuts to the default value' do
      get :index

      expect(assigns(:donuts_url)).to eq 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/250px-Glazed-Donut.jpg'
    end
  end

  context 'when welcome params are not blank' do
    it "only permits whitelisted params" do
      expect(assigns(:unknown_attribute)).to be_nil
    end

    it 'sets @cronuts to the cronuts_url param value' do
      get :index, params: { cronuts_url: 'http://www.google.com' }

      expect(assigns(:cronuts_url)).to eq 'http://www.google.com'
    end

    it 'sets @donuts to the donuts_url param value' do
      get :index, params: { donuts_url: 'http://www.google.com' }

      expect(assigns(:donuts_url)).to eq 'http://www.google.com'
    end
  end
end
