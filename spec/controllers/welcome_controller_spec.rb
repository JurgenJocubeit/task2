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

  context 'when including UrlValidation concern' do
    before do
      class ExampleController < ApplicationController
        include UrlValidation
      end
    end

    after { Object.send :remove_const, :ExampleController }

    let(:object) { ExampleController.new }

    describe 'validate_url method yields expected result' do
      it 'returns url when valid' do
        expect(object.validate_url('http://google.com')).to eq('http://google.com')
      end

      it 'returns nil when invalid' do
        expect(object.validate_url('google.com')).to be_nil
      end

      it 'returns nil when malformed ' do
        expect(object.validate_url('http_//invalid')).to be_nil
      end
    end
  end
end
