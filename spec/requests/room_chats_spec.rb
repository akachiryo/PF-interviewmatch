require 'rails_helper'

RSpec.describe 'RoomChats', type: :request do
  describe 'POST #create' do
    context 'パラメーターが正常な場合' do
      let(:user) { FactoryBot.create :user }
      let(:room) { FactoryBot.create :room }
      let(:room_chat_params) { { room_id: room.id, room_chat: { message: 'a' } } }
      before do
        sign_in user
      end
      # let(:room_chat) { FactoryBot.build :room_chat, user_id: user.id, room_id: room.id }
      # it "リクエストが成功した場合" do
      #   post users_room_chats_path, params: room_chat_params
      #   expect(response.status).to eq 302

      # end
      it 'room_chatの作成が成功した場合' do
      end
      it '作成後、リダイレクトが成功した場合' do
      end
    end
    context 'パラメーターが異常な場合' do
      it 'リクエストが失敗した場合' do
      end
      it 'room_chatの作成が失敗した場合' do
      end
      it '作成後、リダイレクトが失敗した場合' do
      end
    end
  end
end
