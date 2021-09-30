require 'rails_helper'

RSpec.describe Notification, type: :model do
  before do
    @takashi = FactoryBot.create(:takashi)
    @satoshi = FactoryBot.create(:satoshi)
    @user = FactoryBot.create(:user)
    @dmroom = FactoryBot.create(:dmroom)
    @dmmessage = FactoryBot.create(:dmmessage, user_id: @user.id, dmroom_id: @dmroom.id)
    @room = FactoryBot.create(:room)
    @user_room = FactoryBot.create(:user_room, room_id: @room.id, user_id: @user.id)
    @room_chat = FactoryBot.create(:room_chat, room_id: @room.id, user_id: @user.id)

    @notification = FactoryBot.build(:notification)
  end
  context '通知を新規作成が成功する場合' do
    it 'フォロー通知の作成が成功する場合' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = @satoshi.id
      @notification.action = 'follow'
      expect(@notification).to be_valid
    end
    it 'DMメッセージ通知の作成が成功する場合' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = @satoshi.id
      @notification.dmmessage_id = @dmmessage.id
      @notification.action = 'dmmessage'
      expect(@notification).to be_valid
    end
    it 'ROOM新規参加者通知の作成が成功する場合' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = @satoshi.id
      @notification.user_room_id = @user_room.id
      @notification.action = 'user_room'
      expect(@notification).to be_valid
    end
    it 'ROOMチャットに新規メッセージ通知の作成が成功する場合' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = @satoshi.id
      @notification.room_chat_id = @room_chat.id
      @notification.action = 'room_chat'
      expect(@notification).to be_valid
    end
  end

  context '通知を新規作成が失敗する場合' do
    it 'フォロー通知の作成が失敗する場合(visiter_idがない場合)' do
      @notification.visiter_id = ''
      @notification.visited_id = @satoshi.id
      @notification.action = 'follow'
      expect(@notification).not_to be_valid
    end
    it 'フォロー通知の作成が失敗する場合(visited_idがない場合)' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = ''
      @notification.action = 'follow'
      expect(@notification).not_to be_valid
    end
    it 'フォロー通知の作成が失敗する場合(actionがfollowでない場合)' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = @satoshi.id
      @notification.action = ''
      expect(@notification).not_to be_valid
    end
    it 'DMメッセージ通知の作成が失敗する場合(visiter_idがない場合)' do
      @notification.visiter_id = ''
      @notification.visited_id = @satoshi.id
      @notification.dmmessage_id = @dmmessage.id
      @notification.action = 'dmmessage'
      expect(@notification).not_to be_valid
    end
    it 'DMメッセージ通知の作成が失敗する場合(visited_idがない場合)' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = ''
      @notification.dmmessage_id = @dmmessage.id
      @notification.action = 'dmmessage'
      expect(@notification).not_to be_valid
    end
    it 'DMメッセージ通知の作成が失敗する場合(actionがdmmessageでない場合)' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = @satoshi.id
      @notification.dmmessage_id = @dmmessage.id
      @notification.action = ''
      expect(@notification).not_to be_valid
    end
    it 'ROOM新規参加者通知の作成が失敗する場合(visiter_idがない場合)' do
      @notification.visiter_id = ''
      @notification.visited_id = @satoshi.id
      @notification.user_room_id = @user_room.id
      @notification.action = 'user_room'
      expect(@notification).not_to be_valid
    end
    it 'ROOM新規参加者通知の作成が失敗する場合(visited_idがない場合)' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = ''
      @notification.user_room_id = @user_room.id
      @notification.action = 'user_room'
      expect(@notification).not_to be_valid
    end
    it 'ROOM新規参加者通知の作成が失敗する場合(actionがuser_roomでない場合)' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = @satoshi.id
      @notification.user_room_id = @user_room.id
      @notification.action = ''
      expect(@notification).not_to be_valid
    end
    it 'ROOMチャットに新規メッセージ通知の作成が失敗する場合(visiter_idがない場合)' do
      @notification.visiter_id = ''
      @notification.visited_id = @satoshi.id
      @notification.user_room_id = @user_room.id
      @notification.action = 'room_chat'
      expect(@notification).not_to be_valid
    end
    it 'ROOMチャットに新規メッセージ者通知の作成が失敗する場合(visited_idがない場合)' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = ''
      @notification.user_room_id = @user_room.id
      @notification.action = 'room_chat'
      expect(@notification).not_to be_valid
    end
    it 'ROOMチャットに新規メッセージ通知の作成が失敗する場合(actionがroom_chatでない場合)' do
      @notification.visiter_id = @takashi.id
      @notification.visited_id = @satoshi.id
      @notification.user_room_id = @user_room.id
      @notification.action = ''
      expect(@notification).not_to be_valid
    end
  end
end
