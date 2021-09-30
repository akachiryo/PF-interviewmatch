require 'rails_helper'

RSpec.describe Entry, type: :model do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:dmroom)
    @entry = FactoryBot.build(:entry)
  end
  context 'entryの保存が成功したとき' do
    it 'user_id,dmroom_idが存在するとき' do
      @entry.user_id = 1
      @entry.dmroom_id = 1
      expect(@entry).to be_valid
    end
  end
  context 'entryの保存が失敗したとき' do
    it 'user_idが存在しないとき' do
      @entry.user_id = ''
      @entry.dmroom_id = 1
      expect(@entry).not_to be_valid
    end
    it 'dmroom_idが存在しないとき' do
      @entry.user_id = 1
      @entry.dmroom_id = ''
      expect(@entry).not_to be_valid
    end
  end
end
