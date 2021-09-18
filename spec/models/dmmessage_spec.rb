require 'rails_helper'

RSpec.describe Dmmessage, type: :model do
  describe Dmmessage do
    describe "dmmmessage 新規作成" do
      before do
        FactoryBot.create(:user)
        FactoryBot.create(:dmroom)
        @dmmessage = FactoryBot.build(:dmmessage)
      end
      context 'dmmessageの新規作成が成功する場合' do
        it 'user_id,dmroom_id,contentがある場合' do
          @dmmessage.user_id = 1
          @dmmessage.dmroom_id = 1
          @dmmessage.content = "a"
          expect(@dmmessage).to be_valid
        end
      end
      context 'dmmessageの新規作成が失敗する場合' do
        it 'user_idがない場合' do
          @dmmessage.user_id = ""
          @dmmessage.dmroom_id = 1
          @dmmessage.content = "a"
          expect(@dmmessage).not_to be_valid
        end
        it 'dmroom_idがない場合' do
          @dmmessage.user_id = 1
          @dmmessage.dmroom_id = ""
          @dmmessage.content = "a"
          expect(@dmmessage).not_to be_valid
        end
        it 'contentがない場合' do
          @dmmessage.user_id = 1
          @dmmessage.dmroom_id = 1
          @dmmessage.content = ""
          expect(@dmmessage).not_to be_valid
        end
      end
    end
  end

end
