require 'rails_helper'

RSpec.describe Room, type: :model do

describe Room do

  describe 'ルーム新規作成' do
    before do
      FactoryBot.create(:user)
      FactoryBot.create(:time_tag)
      FactoryBot.create(:ocuupation_tag)
      @room = FactoryBot.build(:room)
    end
    context 'ルーム作成がうまくいくとき' do
      it 'user_id,time_tag_id,ocuppaition_id,title,contentが存在すれば登録できる' do
        @room.user_id = 1
        @room.time_tag_id = 1
        @room.ocuupation_tag_id = 1
        expect(@room).to be_valid
      end
      it 'titleが存在する場合登録できる' do
        @room.title = 'a'
        @room.user_id = 1
        @room.time_tag_id = 1
        @room.ocuupation_tag_id = 1
        expect(@room).to be_valid
      end
      it 'contentが存在する場合でも登録できる' do
        @room.content = 'a'
        @room.user_id = 1
        @room.time_tag_id = 1
        @room.ocuupation_tag_id = 1
        expect(@room).to be_valid
      end
    end

    context 'ルーム作成がうまくいかないとき'  do
      it 'user_idがないとき' do
         @room.user_id = ""
         @room.time_tag_id = 1
         @room.ocuupation_tag_id = 1
         expect(@room).not_to be_valid
      end
      it 'time_tag_idがないとき' do
         @room.user_id = 1
         @room.time_tag_id = ""
         @room.ocuupation_tag_id = 1
         expect(@room).not_to be_valid
      end
      it 'ocuupation_tag_idがないとき' do
         @room.user_id = 1
         @room.time_tag_id = 1
         @room.ocuupation_tag_id = ""
         expect(@room).not_to be_valid
      end
      it 'titleがない場合' do
         @room.user_id = 1
         @room.time_tag_id = 1
         @room.ocuupation_tag_id = 1
         @room.title = ""
         expect(@room).not_to be_valid
      end

    end
  end
end
end
