require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET #sign_in/new" do
    context "パラメーターが正常な場合" do
      it "リクエストが成功したとき" do
      end
      it "入力フォームが正しく表示されているとき" do
      end
    end
    context "パラメーターが異常な場合" do
      it "リクエストが失敗したとき" do
      end
      it "入力フォームが正しくないとき" do
      end
    end
  end
  describe "GET #sign_in/create" do
    context "パラメーターが正常な場合" do
      it "リクエストが成功したとき" do
      end
      it "正しく作成された場合" do
      end
      it "room#indexに遷移するとき" do
      end
    end
    context "パラメーターが異常な場合" do
      it "リクエストが失敗したとき" do
      end
      it "emailが入っていないとき" do
      end
      it "passwordが入っていないとき" do
      end
      it "session#newに遷移するとき" do
      end
    end
  end
  describe "GET #sign_out/destroy" do
    context "パラメーターが正常な場合" do
      it "リクエストが成功したとき" do
      end
      it "正しく削除されたとき" do
      end
      it "room#indexに遷移したとき" do
      end
    end
  end
end
