require 'rails_helper'
require 'uri'

RSpec.describe "welcome/index.html.erb", type: :view do
  context 'when welcome params are blank' do
    it "links are empty when no params assigned" do
      render

      expect(rendered).to have_selector("a.cronuts[href='']")
      expect(rendered).to have_selector("a.donuts[href='']")
    end
  end

  context 'when welcome params are not blank' do
    let(:assigned_cronuts_url) { 'https://google.com' }
    let(:assigned_donuts_url) { 'http://www.google.com' }

    it 'valid links contain assigned params' do
      assign(:cronuts_url, assigned_cronuts_url)
      assign(:donuts_url, assigned_donuts_url)

      render

      cronuts_selector = "a.cronuts[href=\"#{assigned_cronuts_url}\"]"
      expect(rendered).to have_selector(cronuts_selector)

      donuts_selector = "a.donuts[href=\"#{assigned_donuts_url}\"]"
      expect(rendered).to have_selector(donuts_selector)
    end
  end

  context 'locales are properly handled' do
    it "uses english title by default" do
      expect(I18n.locale).to eq(:en)

      render

      expect(rendered).to have_selector("h2.widget_title", text: "Cronut acceptance widget", exact_text: true)
    end
  end
end
