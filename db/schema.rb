# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_921_112_953) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.integer 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'admins', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_admins_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admins_on_reset_password_token', unique: true
  end

  create_table 'dmmessages', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'dmroom_id'
    t.text 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['dmroom_id'], name: 'index_dmmessages_on_dmroom_id'
    t.index ['user_id'], name: 'index_dmmessages_on_user_id'
  end

  create_table 'dmrooms', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'entries', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'dmroom_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['dmroom_id'], name: 'index_entries_on_dmroom_id'
    t.index ['user_id'], name: 'index_entries_on_user_id'
  end

  create_table 'notifications', force: :cascade do |t|
    t.integer 'visiter_id'
    t.integer 'visited_id'
    t.integer 'dmmessage_id'
    t.integer 'user_room_id'
    t.integer 'room_chat_id'
    t.string 'action'
    t.boolean 'checked', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'ocuupation_tags', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'relationships', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'follow_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['follow_id'], name: 'index_relationships_on_follow_id'
    t.index %w[user_id follow_id], name: 'index_relationships_on_user_id_and_follow_id', unique: true
    t.index ['user_id'], name: 'index_relationships_on_user_id'
  end

  create_table 'room_chats', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'room_id', null: false
    t.text 'message'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'room_tags', force: :cascade do |t|
    t.integer 'room_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'tag_id'
    t.index ['room_id'], name: 'index_room_tags_on_room_id'
    t.index ['tag_id'], name: 'index_room_tags_on_tag_id'
  end

  create_table 'rooms', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.string 'title', null: false
    t.string 'content', default: '????????????????????????'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'active', default: true, null: false
  end

  create_table 'schedules', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'content'
    t.datetime 'start_time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', null: false
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'time_tags', force: :cascade do |t|
    t.string 'span', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'user_rooms', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'room_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'active', default: true, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'name', default: '', null: false
    t.text 'introduction'
    t.boolean 'is_deleted', default: false, null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
