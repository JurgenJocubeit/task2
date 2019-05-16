require 'rails_helper'
require 'uri'

RSpec.describe WelcomeController, type: :controller do
  context 'when welcome params are blank' do
    before { get :index }

    it 'sets @cronuts to the default value' do
      expect(assigns(:cronuts_url)).to eq(URI.escape(
        'https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%' \
        'AE_2_Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg'))
    end

    it 'sets @donuts to the default value' do
      expect(assigns(:donuts_url)).to eq(URI.escape(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg' \
        '/250px-Glazed-Donut.jpg'))
    end
  end

  context 'when welcome params are not blank' do
    before do
      get :index, {
        params: {
          cronuts_url: 'http://www.google.com',
          donuts_url: 'http://www.google.com',
          unpermitted_param: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
        }
      }
    end

    it "only permits whitelisted params" do
      expect(assigns(:unpermitted_param)).to be_nil
    end

    it 'sets @cronuts to the cronuts_url param value' do
      expect(assigns(:cronuts_url)).to eq(URI.escape('http://www.google.com'))
    end

    it 'sets @donuts to the donuts_url param value' do
      expect(assigns(:donuts_url)).to eq(URI.escape('http://www.google.com'))
    end
  end
end
