require 'rails_helper'

RSpec.describe UserRoom, type: :model do
  describe 'ユーザールームを新規作成する場合' do
    before do
      @user = FactoryBot.create(:user)
      @room = FactoryBot.create(:room)
      @user_room = FactoryBot.build(:user_room)
    end
    context 'ユーザールームを新規作成が成功する場合' do
      it 'user_id,room_idが存在する場合' do
        @user_room.user_id = @user.id
        @user_room.room_id = @room.id
        expect(@user_room).to be_valid
      end
    end
    context 'ユーザールームを新規作成が失敗する場合' do
      it 'user_idが存在しない場合' do
        @user_room.user_id = ""
        @user_room.room_id = @room.id
        expect(@user_room).not_to be_valid
      end
      it 'room_idが存在しない場合' do
        @user_room.user_id = @user.id
        @user_room.room_id = ""
        expect(@user_room).not_to be_valid
      end
    end

  end
end
