require 'rails_helper'

RSpec.describe "Dmrooms", type: :request do
  describe "GET #show" do
    let(:user) { FactoryBot.create :user }
    before do
      sign_in user
    end
    context 'dmroomが存在するとき' do
    # let(:dmroom) { FactoryBot.create :dmroom }
    #   it "リクエストが成功するとき" do
    #     @user = FactoryBot.create(:takashi)
    #     # binding.pry
    #     get users_dmroom_path(dmroom.id)
    #     expect(response.status).to eq 200
    #     # 200じゃない？？
    #   end
    #   it '相手のユーザー名が表示されていること' do
    #     get users_dmroom_path(dmroom.id)
    #     expect(response.body).to include 'Takashi'
    #   end
    end
    context 'dmroomが存在しない場合' do
      it {
        expect do
          get users_dmroom_path(99)
        end.to raise_error(ActiveRecord::RecordNotFound)
      }
  end
  end

  describe "POST #create" do
    context "パラメーターが妥当な場合"  do
      let(:user) { FactoryBot.create(:user) }
      before do
        sign_in user
      end
      it "リクエストが成功すること" do
        post users_dmrooms_url
        expect(response.status).to eq 302
      end
      it "dmroomが作成されていること" do
          expect do
            post users_dmrooms_url
          end.to change(Dmroom, :count).by(1)
      end
      it "dmroomにリダイレクトすること" do
        post users_dmrooms_url
        expect(response).to redirect_to users_dmroom_path(1)
      end
    end
    context "パラメーターが不当な場合"  do
      it "リクエストが失敗すること" do
        post users_dmrooms_url
        FactoryBot.attributes_for(:dmroom, :invalid)
        expect(response.status).not_to redirect_to users_dmroom_path(1)
      end
      it "dmroomが作成されないこと" do
        expect do
          post users_dmrooms_url
          FactoryBot.attributes_for(:dmroom, :invalid)
        end.to change(Dmroom, :count).by(0)
      end
    end
  end
end
