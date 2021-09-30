require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  describe 'GET #index' do
    context 'パラメーターが正常な場合' do
      it 'リクエストが成功するとき' do
      end
      it 'ルーム一覧が正しく表示されているとき' do
      end
    end
    context 'パラメーターが異常な場合' do
      it 'リクエストが失敗するとき' do
      end
      it 'ルーム一覧が正しく表示されないとき' do
      end
    end
  end
  describe 'GET #show' do
    context 'パラメーターが正常な場合' do
      it 'リクエストが成功するとき' do
      end
      it 'ルームタイトルが正しく表示されているとき' do
      end
    end
    context 'パラメーターが異常な場合' do
      it 'リクエストが失敗するとき' do
      end
      it 'ルームタイトルが正しく表示されないとき' do
      end
    end
  end
  describe 'GET #new' do
    context 'パラメーターが正常な場合' do
      it 'リクエストが成功するとき' do
      end
      it 'newテンプレートが正しく表示されているとき' do
      end
      it '@roomに値が入っていないとき' do
      end
    end
    context 'パラメーターが異常な場合' do
      it 'リクエストが失敗するとき' do
      end
      it 'newテンプレートが正しく表示されないとき' do
      end
      it '@roomがに値が入っているとき' do
      end
    end
  end
  describe 'GET #search' do
    context 'パラメーターが正常な場合' do
      it 'リクエストが成功するとき' do
      end
      it '正しい検索結果が表示されているとき' do
      end
    end
    context 'パラメーターが異常な場合' do
      it 'リクエストが失敗するとき' do
      end
      it '正しい値が表示されないとき' do
      end
    end
  end
  describe 'GET #finish' do
    context 'パラメーターが正常な場合' do
      it 'リクエストが成功するとき' do
      end
      it '相手のプロフィールが表示されているとき' do
      end
    end
    context 'パラメーターが異常な場合' do
      it 'リクエストが失敗するとき' do
      end
      it '相手のプロフィールが表示されないとき' do
      end
    end
  end
  describe 'POST #create' do
    context 'パラメーターが正常な場合' do
      it 'リクエストが成功するとき' do
      end
      it 'roomが作成されたとき' do
      end
      it 'リダイレクトされるとき' do
      end
    end
    context 'パラメーターが異常な場合' do
      it 'リクエストが失敗するとき' do
      end
      it 'roomが作成されないとき' do
      end
      it 'newアクションに遷移すること' do
      end
      it 'エラーが表示されること' do
      end
    end
  end
  describe 'DELETE #destroy' do
    context 'パラメーターが正常な場合' do
      it 'リクエストが成功するとき' do
      end
      it 'roomが削除されたとき' do
      end
      it 'ユーザー一覧にリダイレクトされるとき' do
      end
    end
  end
end
