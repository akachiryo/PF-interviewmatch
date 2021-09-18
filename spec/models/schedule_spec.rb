require 'rails_helper'

RSpec.describe Schedule, type: :model do
describe Schedule do
  describe "スケジュール新規作成" do
    before do
      @schedule = FactoryBot.build(:schedule)
      FactoryBot.create(:user)
    end
    context 'スケジュールの新規登録がうまくいくとき' do
      it 'タイトルが存在する場合登録できる' do
        @schedule.title = 'a'
        @schedule.user_id = '1'
        expect(@schedule).to be_valid
      end
    end
    context 'スケジュールの新規登録がうまくいかないとき' do
      it 'タイトルが存在しない場合登録できない' do
        @schedule.title = ''
        @schedule.user_id = '1'
        expect(@schedule).not_to be_valid
      end
      it 'User_idが存在しない場合登録できない' do
        @schedule.user_id = ''
        expect(@schedule).not_to be_valid
      end
      it 'start_timeが存在しない場合登録できない' do
        @schedule.user_id = '1'
        @schedule.start_time = ''
        expect(@schedule).not_to be_valid
      end
    end
  end
end
end
