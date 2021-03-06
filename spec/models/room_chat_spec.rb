require 'rails_helper'

RSpec.describe RoomChat, type: :model do
  describe 'ROOMチャットを新規作成する場合' do
    before do
      @user = FactoryBot.create(:user)
      @room = FactoryBot.create(:room)
      @room_chat = FactoryBot.build(:room_chat)
    end
    context 'ROOMチャットを新規作成し、成功する場合' do
      it 'user_id,room_idが存在する場合' do
        @room_chat.user_id = @user.id
        @room_chat.room_id = @room.id
        expect(@room_chat).to be_valid
      end
    end
    context 'ROOMチャットを新規作成し、失敗する場合' do
      it 'user_idが存在しない場合' do
        @room_chat.user_id = ''
        @room_chat.room_id = @room.id
        expect(@room_chat).not_to be_valid
      end
      it 'room_idが存在しない場合' do
        @room_chat.user_id = @user.id
        @room_chat.room_id = ''
        expect(@room_chat).not_to be_valid
      end
    end
  end
end
