require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'GET #sign_up' do
    context 'パラメーターが正常な場合' do
      it 'リクエストが成功したとき' do
      end
      it 'newテンプレートが正しく表示されているとき' do
      end
      it '@roomに値がはいっていないとき' do
      end
    end
    context 'パラメーターが異常な場合' do
      it 'リクエストに失敗したとき' do
      end
      it 'newテンプレートが正しく表示されないとき' do
      end
    end
  end
  describe 'POST #create' do
    context 'パラメーターが正常な場合' do
      it 'リクエストが成功したとき' do
      end
      it 'roomが作成されたとき' do
      end
      it 'room#indexに遷移したとき' do
      end
    end
    context 'パラメーターが異常な場合' do
      it 'リクエストが失敗したとき' do
      end
      it 'nameが空白のとき' do
      end
      it 'emailが空白のとき' do
      end
      it 'passwordが空白のとき' do
      end
      it '#sign_upに遷移されるとき' do
      end
    end
  end
end
