require 'rails_helper'

RSpec.describe TimeTag, type: :model do
  describe TimeTag do
    describe 'time_tagを新規作成する' do
      before do
        @time_tag = FactoryBot.build(:time_tag)
      end
      context 'time_tagの新規作成が成功する場合' do
        it 'nameが存在する場合' do
          @time_tag.span = "a"
          expect(@time_tag).to be_valid
        end
      end

      context 'time_tagの新規作成が失敗する場合' do
        it 'spanが存在しない場合' do
          @time_tag.span = ""
          expect(@time_tag).not_to be_valid
        end
      end
    end
  end
end
