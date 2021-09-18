require 'rails_helper'

RSpec.describe OcuupationTag, type: :model do
  describe OcuupationTag do
    describe 'ocuupation_tagを新規作成する' do
      before do
        @ocuupation_tag = FactoryBot.build(:ocuupation_tag)
      end
      context 'ocuupation_tagの新規作成が成功する場合' do
        it 'nameが存在する場合' do
          @ocuupation_tag.name = "a"
          expect(@ocuupation_tag).to be_valid
        end
      end

      context 'ocuupation_tagの新規作成が失敗する場合' do
        it 'nameが存在しない場合' do
          @ocuupation_tag.name = ""
          expect(@ocuupation_tag).not_to be_valid
        end
      end
    end
  end
end
