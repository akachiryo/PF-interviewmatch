require 'rails_helper'

RSpec.describe 'Dmmessages', type: :request do
  describe 'POST #create' do
    it 'パラメーターが妥当な場合' do
      post users_dmmessages_url
      expect(response.status).to eq 302
    end
    it 'パラメーターが妥当でない場合' do
      post users_dmmessages_url(2)
      expect(response.status).not_to eq 302
    end
  end
end
