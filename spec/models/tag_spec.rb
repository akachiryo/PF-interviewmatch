require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'タグの保存がうまくいくとき' do
    it "nameが存在するとき" do
      @tag = FactoryBot.build(:tag)
      expect(@tag).to be_valid
    end
  end
  context 'タグの保存がうまくいかないとき' do
    it "nameが存在しないとき" do
      @tag = FactoryBot.build(:tag)
      @tag.name = nil
      expect(@tag).not_to be_valid
    end
  end

end
