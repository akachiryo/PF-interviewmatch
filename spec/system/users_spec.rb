require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { FactoryBot.create(:user) }
  describe 'User CRUD' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            visit new_user_registration_path
            fill_in 'user[name]', with: 'test'
            fill_in 'user[email]', with: 'test@example.com'
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button 'Sign up'
            expect(current_path).to eq users_rooms_path
          end
        end
        context 'メールアドレス未記入' do
          it 'ユーザーの新規作成が失敗' do
            visit new_user_registration_path
            fill_in 'user[name]', with: 'test'
            fill_in 'user[email]', with: nil
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button 'Sign up'
            expect(current_path).to eq '/users'
            expect(page).to have_content 'Eメールを入力してください'
          end
        end
        context '既に登録されてるメールアドレス' do
          it 'ユーザーの新規作成が失敗' do
            visit new_user_registration_path
            fill_in 'user[name]', with: 'test'
            fill_in 'user[email]', with: user.email
            fill_in 'user[password]', with: 'password'
            fill_in 'user[password_confirmation]', with: 'password'
            click_button 'Sign up'
            expect(current_path).to eq '/users'
            expect(page).to have_content 'Eメールはすでに存在します'
          end
        end
        context 'パスワード未記入' do
          it 'ユーザーの新規作成が失敗' do
            visit new_user_registration_path
            fill_in 'user[name]', with: 'test'
            fill_in 'user[email]', with: 'test@example.com'
            fill_in 'user[password]', with: nil
            fill_in 'user[password_confirmation]', with: 'password'
            click_button 'Sign up'
            expect(current_path).to eq '/users'
            expect(page).to have_content 'パスワードを入力してください'
          end
        end
      end
      describe 'ユーザーログイン' do
        context 'フォームの入力値が正常' do
          it 'ユーザーのログインが成功' do
            visit new_user_session_path
            fill_in 'user[email]', with: user.email
            fill_in 'user[password]', with: user.password
            click_button 'Log in'
            expect(current_path).to eq users_rooms_path
          end
        end
        context 'メールアドレス未記入' do
          it 'ユーザーのログインが失敗' do
            visit new_user_session_path
            fill_in 'user[email]', with: nil
            fill_in 'user[password]', with: user.password
            click_button 'Log in'
            expect(current_path).to eq new_user_session_path
          end
        end
        context 'パスワード未記入' do
          it 'ユーザーのログインが失敗' do
            visit new_user_session_path
            fill_in 'user[email]', with: user.email
            fill_in 'user[password]', with: nil
            click_button 'Log in'
            expect(current_path).to eq new_user_session_path
          end
        end
      end
    end
    describe 'ログイン後' do
      describe 'ユーザー編集'
      context 'フォームの入力値変更なし' do
        before do
          visit new_user_session_path
          fill_in 'user[email]', with: user.email
          fill_in 'user[password]', with: user.password
          click_button 'Log in'
        end
        it 'ユーザーの編集が成功' do
          visit edit_user_path(user)
          fill_in 'user[name]', with: user.name
          fill_in 'user[email]', with: user.email
          # fill_in "user[image]", with: nil
          fill_in 'user[introduction]', with: 'aaa'
          click_button '編集内容を保存'
          expect(current_path).to eq user_path(user)
        end
      end
      context 'メールアドレス未記入' do
        it 'ユーザーの編集が失敗' do
          # visit edit_user_path(user)
          # fill_in 'Email', with: nil
          # fill_in 'Password', with: 'password'
          # fill_in 'Password confirmation', with: 'password'
          # click_button 'Update'
          # expect(current_path).to eq user_path(user)
          # expect(page).to have_content "Email can't be blank"
        end
      end
    end
  end
end
