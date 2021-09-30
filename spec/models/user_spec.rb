require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    describe 'ユーザー新規登録' do
      before do
        @user = FactoryBot.build(:user)
      end
      context '新規登録がうまくいくとき' do
        it 'nameとemailとpassword、が存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'nameがあれば登録できる' do
          @user.name = 'aaaaaa'
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上であれば登録できる' do
          @user.password = '000000'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空だと登録できない' do
          @user.name = ''
          expect(@user).not_to be_valid
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          expect(@user).not_to be_valid
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          expect(@user).not_to be_valid
        end
        it 'passwordが5文字以下であれば登録できない' do
          @user.password = 'aaaaa'
          expect(@user).not_to be_valid
        end
      end
    end
  end
end
