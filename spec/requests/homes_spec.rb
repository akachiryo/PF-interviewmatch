require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET #homes' do
    it 'リクエストが成功すること' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #about' do
    it 'リクエストが成功すること' do
      get homes_about_path
      expect(response).to have_http_status(200)
    end
  end
end
