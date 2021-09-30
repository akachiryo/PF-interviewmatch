require 'rails_helper'

RSpec.describe 'Relationships', type: :request do
  describe 'POST #create' do
    context 'パラメーターが妥当な場合' do
      let(:user) { FactoryBot.create :user }
      before do
        sign_in user
      end
      it 'リクエストが成功する場合' do
        post users_relationships_url
        expect(response.status).to eq 302
      end
      it 'relationshipが作成された場合' do
        takashi = FactoryBot.create(:takashi)
        expect do
          post users_relationships_url
          FactoryBot.create(:relationship, user_id: user.id, follow_id: takashi.id)
        end.to change(Relationship, :count).by(1)
      end
      it '作成後リダイレクトされた場合' do
        post users_relationships_url
        expect(response).to redirect_to users_rooms_finish_path
      end
    end
    context 'パラメーターが不当な場合' do
      let(:user) { FactoryBot.create :user }
      before do
        sign_in user
      end
      it 'relationshipが作成されない場合' do
        expect do
          post users_relationships_url
        end.to change(Relationship, :count).by(0)
      end
    end
  end
  describe 'DELETE #destroy' do
    context 'パラメーターが妥当な場合' do
      let(:takashi) { FactoryBot.create :takashi }
      let(:satoshi) { FactoryBot.create :satoshi }
      it 'リクエストが成功すること' do
        relationship = FactoryBot.create(:relationship, user_id: takashi.id, follow_id: satoshi.id)
        delete users_relationship_path(relationship.id)
        expect(response.status).to eq 302
      end

      it 'ユーザーが削除されること' do
        relationship = FactoryBot.create(:relationship, user_id: takashi.id, follow_id: satoshi.id)
        expect do
          delete users_relationship_path(relationship)
        end.to change(Relationship, :count).by(-1)
      end

      it 'ユーザー一覧にリダイレクトすること' do
        relationship = FactoryBot.create(:relationship, user_id: takashi.id, follow_id: satoshi.id)
        delete users_relationship_path(relationship.id)
        expect(response).to redirect_to user_path(relationship.follow_id)
      end
    end
  end
end
