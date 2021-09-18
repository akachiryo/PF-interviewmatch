require 'rails_helper'

RSpec.describe "OcuupationTags", type: :request do
   describe "GET #index" do
   context "パラメーターが正常な場合" do
     it "リクエストが成功したとき" do
     end
     it "職業指定タグが正しく表示されているとき" do
     end
   end
  end
  describe "GET #edit" do
   context "パラメーターが正常な場合" do
     it "リクエストが成功したとき" do
     end
     it "@ocuupation_tagに正しい値が入っているとき" do
     end
   end
  end
  describe "POST #create" do
   context "パラメーターが正常な場合" do
      it "リクエストが成功するとき" do
      end
      it "職種指定タグが作成されたとき" do
      end
      it "ocuupation_tag#indexにリダイレクトされるとき" do
      end
    end
    context "パラメーターが異常な場合" do
      it "リクエストが失敗するとき" do
      end
      it "職種指定タグが作成されないとき" do
      end
      it "newアクションに遷移すること" do
      end
      it "エラーが表示されること" do
      end
    end
  end
   describe "PATCH #update" do
      context "パラメーターが正常な場合" do
        it "リクエストが成功するとき" do
        end
        it "@ocuupation_tagが正しく更新されたとき" do
        end
        it "ocuupation_tag#indexにリダイレクトされたとき" do
        end
      end
      context "パラメーターが異常な場合" do
        it "リクエストが失敗するとき" do
        end
        it "ocuupation_tagが空白のとき" do
        end
        it "ocuupation_tag#editにリダイレクトされたとき" do
        end
      end
    end
end
