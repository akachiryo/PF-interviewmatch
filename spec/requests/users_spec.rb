require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'GET #index' do
      let(:admin) { FactoryBot.create :admin }
      let(:takashi) { FactoryBot.create :takashi }
      let(:satoshi) { FactoryBot.create :satoshi }
      before do
        sign_in takashi
        sign_in satoshi
        sign_in admin
      end
    it 'リクエストが成功すること' do
      get admins_users_path
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      get admins_users_path
      expect(response.body).to include "Takashi"
      expect(response.body).to include "Satoshi"
    end
  end

  describe 'GET #show' do
    context 'ユーザーが存在する場合' do
      let(:takashi) { FactoryBot.create :takashi }
      before do
        sign_in takashi
      end
      it 'リクエストが成功すること' do
        get user_path(takashi.id)
        expect(response.status).to eq 200
      end

      it 'ユーザー名が表示されていること' do
        get user_url takashi.id
        expect(response.body).to include 'Takashi'
      end
    end

    context 'ユーザーが存在しない場合' do
      let(:takashi) { FactoryBot.create :takashi }
      before do
        sign_in takashi
      end

      it {
        expect do
          get user_path 99
        end.to raise_error(ActiveRecord::RecordNotFound)
      }
    end
  end

  describe 'GET #edit' do
   let(:takashi) { FactoryBot.create :takashi }
   before do
     sign_in takashi
   end

   it 'リクエストが成功すること' do
     get edit_user_url takashi
     expect(response.status).to eq 200
   end

   it 'ユーザー名が表示されていること' do
     get edit_user_url takashi
     expect(response.body).to include 'Takashi'
   end

   it 'メールアドレスが表示されていること' do
     get edit_user_url takashi
     expect(response.body).to include 'takashi@example.com'
   end
  end

  describe 'PATCH #update' do
    let(:takashi) { FactoryBot.create :takashi }
    before do
     sign_in takashi
    end

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        patch user_url takashi, params: { user: FactoryBot.attributes_for(:satoshi) }
        expect(response.status).to eq 302
      end

      it 'ユーザー名が更新されること' do
        expect do
          patch user_url takashi, params: { user: FactoryBot.attributes_for(:satoshi) }
        end.to change { User.find(takashi.id).name }.from('Takashi').to('Satoshi')
      end

      it 'リダイレクトすること' do
        patch user_url takashi, params: { user: FactoryBot.attributes_for(:satoshi) }
        expect(response).to redirect_to  user_path(takashi.id)
      end
    end

    context 'パラメータが不正な場合' do
       let(:takashi) { FactoryBot.create :takashi }
        before do
         sign_in takashi
        end
      it 'リクエストが成功すること' do
        patch user_url takashi, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.status).to eq 302
      end

      it 'ユーザー名が変更されないこと' do
        expect do
          patch user_url takashi, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        end.to_not change(User.find(takashi.id), :name)
      end

      # it 'エラーが表示されること' do
      #   patch user_url takashi, params: { user: FactoryBot.attributes_for(:user, :invalid) }
      #   expect(response.body).to include 'prohibited this user from being saved'
      # end
    end
  end

  describe 'PATCH #withdrawal' do
    let(:user) { FactoryBot.create :user }
    before do
     sign_in user
    end

    it 'リクエストが成功すること' do
      patch withdrawal_url user
      expect(response.status).to eq 302
    end

    it '退会フラグがtrueになり、home#topにリダイレクトすること' do
      patch withdrawal_url user, params: { user: FactoryBot.attributes_for(:user, :is_deleted) }
      expect(response).to redirect_to root_path
    end
  end
end