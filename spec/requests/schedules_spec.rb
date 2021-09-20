require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  describe "GET #index" do
    context "パラメーターが正常な場合" do
      it "リクエストが成功した場合" do
      end
      it "スケジュールが正しく表示された場合" do
      end
    end
    context "パラメーターが異常な場合" do
      it "リクエストが失敗した場合" do
      end
      it "スケジュールが正しく表示されない場合" do
      end
    end
  end
  describe "GET #new" do
    context "パラメーターが正常な場合" do
      it "リクエストが成功したとき" do
      end
      it "newテンプレートが正しく表示されたとき" do
      end
      it "@scheduleに値が入っていないとき" do
      end
    end
    context "パラメーターが異常な場合" do
      it "リクエストが失敗したとき" do
      end
      it "newテンプレートが正しく表示されないとき" do
      end
      it "@scheduleに値が入っているとき" do
      end
    end
  end
  describe "GET #show" do
    context "パラメーターが正常な場合" do
      it "リクエストが成功するとき" do
      end
      it "スケジュールのタイトルが正しく表示されているとき" do
      end
    end
    context "パラメーターが異常な場合" do
      it "リクエストが失敗するとき" do
      end
      it "スケジュールのタイトルが正しく表示されないとき" do
      end
    end
  end
  describe "POST #create" do
    context "パラメーターが正常な場合" do
      it "リクエストが成功するとき" do
      end
      it "スケジュールが作成されたとき" do
      end
      it "リダイレクトされるとき" do
      end
    end
    context "パラメーターが異常な場合" do
      it "リクエストが失敗するとき" do
      end
      it "スケジュールが作成されないとき" do
      end
      it "newアクションに遷移すること" do
      end
      it "エラーが表示されること" do
      end
    end
    describe "DELETE #destroy" do
      context "パラメーターが正常な場合" do
        it "リクエストが成功するとき" do
        end
        it "スケジュールが削除されたとき" do
        end
        it "indexにリダイレクトされるとき" do
        end
      end
    end
    describe "GET #edit" do
      context "パラメーターが正常な場合" do
        it "リクエストが成功するとき" do
        end
        it "@scheduleに値が正しく入ったとき" do
        end
      end
    end
    describe "PATCH #update" do
      context "パラメーターが正常な場合" do
        it "リクエストが成功するとき" do
        end
        it "@scheduleが正しく更新されたとき" do
        end
        it "リダイレクトされたとき" do
        end
      end
      context "パラメーターが異常な場合" do
        it "リクエストが失敗するとき" do
        end
        it "スケジュールのタイトルが空白のとき" do
        end
        it "スケジュールの日付が空白のとき" do
        end
        it "editにリダイレクトされたとき" do
        end
      end
    end
  end
end
