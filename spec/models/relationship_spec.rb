require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @takashi = FactoryBot.create(:takashi)
    @satoshi = FactoryBot.create(:satoshi)
    @relationship = FactoryBot.build(:relationship)
  end
  describe 'フォローを新規作成する場合' do
    context 'フォローの新規作成が成功する場合' do
      it 'user_id,follow_idがある場合' do
        @relationship.user_id = @takashi.id
        @relationship.follow_id = @satoshi.id
        expect(@relationship).to be_valid
      end
    end
    context 'フォローの新規作成が失敗する場合' do
      it 'user_idがない場合' do
        @relationship.user_id = ''
        @relationship.follow_id = @satoshi.id
        expect(@relationship).not_to be_valid
      end
      it 'follow_idがない場合' do
        @relationship.user_id = @takashi.id
        @relationship.follow_id = ''
        expect(@relationship).not_to be_valid
      end
    end
  end
end
