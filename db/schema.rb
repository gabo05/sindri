# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150122044922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.integer  "email_id",               null: false
    t.string   "passsword",  limit: nil, null: false
    t.string   "picture",    limit: nil
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "state",      limit: 1,   null: false
  end

  add_index "accounts", ["email_id"], name: "accounts_fkindex1", using: :btree
  add_index "accounts", ["email_id"], name: "ifk_is_identified", using: :btree

  create_table "accounts_roles", force: true do |t|
    t.integer  "accounts_id",                                                                          null: false
    t.integer  "roles_id",                                                                             null: false
    t.integer  "created_at",            default: "nextval('accounts_roles_created_at_seq'::regclass)", null: false
    t.datetime "updated_at",                                                                           null: false
    t.string   "state",       limit: 1,                                                                null: false
  end

  add_index "accounts_roles", ["accounts_id"], name: "accounts_roles_fkindex1", using: :btree
  add_index "accounts_roles", ["accounts_id"], name: "ifk_has_many", using: :btree
  add_index "accounts_roles", ["roles_id"], name: "accounts_roles_fkindex2", using: :btree
  add_index "accounts_roles", ["roles_id"], name: "ifk_is_assigned", using: :btree

  create_table "activities", force: true do |t|
    t.integer  "schedules_id",             null: false
    t.string   "name",         limit: nil
    t.text     "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "predecessor"
    t.string   "completed",    limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",        limit: 1
  end

  add_index "activities", ["schedules_id"], name: "activities_fkindex1", using: :btree
  add_index "activities", ["schedules_id"], name: "ifk_rel_29", using: :btree

  create_table "agents", force: true do |t|
    t.integer  "appointment_id",                                     null: false
    t.string   "first_name",     limit: nil,                         null: false
    t.string   "last_name",      limit: nil,                         null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "state",          limit: 1,   default: "(1)::bit(1)", null: false
  end

  add_index "agents", ["appointment_id"], name: "agents_fkindex1", using: :btree
  add_index "agents", ["appointment_id"], name: "ifk_rel_17", using: :btree

  create_table "appointments", force: true do |t|
    t.string   "name",        limit: nil
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",       limit: 1,   null: false
  end

  create_table "attachments", force: true do |t|
    t.string   "name",       limit: nil
    t.string   "path",       limit: nil
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",      limit: 1
  end

  create_table "business", force: true do |t|
    t.string   "name",       limit: nil
    t.string   "logo",       limit: nil
    t.string   "color1",     limit: nil
    t.string   "color2",     limit: nil
    t.string   "color3",     limit: nil, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",      limit: 1
  end

  create_table "business_agents", id: false, force: true do |t|
    t.integer  "agents_id",                                                                             null: false
    t.integer  "business_id",                                                                           null: false
    t.integer  "created_at",            default: "nextval('business_agents_created_at_seq'::regclass)", null: false
    t.datetime "updated_at"
    t.string   "state",       limit: 1
  end

  add_index "business_agents", ["agents_id"], name: "business_agents_fkindex2", using: :btree
  add_index "business_agents", ["agents_id"], name: "ifk_rel_21", using: :btree
  add_index "business_agents", ["business_id"], name: "business_agents_fkindex1", using: :btree
  add_index "business_agents", ["business_id"], name: "ifk_rel_20", using: :btree

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "color1"
    t.string   "color2"
    t.string   "color3"
    t.boolean  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name",        limit: nil
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",       limit: 1
  end

  create_table "clients", force: true do |t|
    t.integer  "business_id",                 null: false
    t.integer  "appointments_id",             null: false
    t.string   "first_name",      limit: nil, null: false
    t.string   "last_name",       limit: nil, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "state",           limit: 1,   null: false
  end

  add_index "clients", ["appointments_id"], name: "clients_fkindex1", using: :btree
  add_index "clients", ["appointments_id"], name: "ifk_rel_18", using: :btree
  add_index "clients", ["business_id"], name: "clients_fkindex2", using: :btree
  add_index "clients", ["business_id"], name: "ifk_rel_22", using: :btree

  create_table "conversations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",      limit: 1
  end

  create_table "emails", force: true do |t|
    t.integer  "client_id"
    t.integer  "agent_id"
    t.string   "email",      limit: nil,                         null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "state",      limit: 1,   default: "(1)::bit(1)", null: false
  end

  add_index "emails", ["agent_id"], name: "emails_fkindex1", using: :btree
  add_index "emails", ["agent_id"], name: "ifk_has_many_a", using: :btree
  add_index "emails", ["client_id"], name: "emails_fkindex2", using: :btree
  add_index "emails", ["client_id"], name: "ifk_has_many_c", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name",        limit: nil
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",       limit: 1
  end

  create_table "groups_agents", force: true do |t|
    t.integer  "groups_id",            null: false
    t.integer  "agents_id",            null: false
    t.string   "is_manager", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",      limit: 1
  end

  add_index "groups_agents", ["agents_id"], name: "groups_agents_fkindex2", using: :btree
  add_index "groups_agents", ["agents_id"], name: "ifk_rel_36", using: :btree
  add_index "groups_agents", ["groups_id"], name: "groups_agents_fkindex1", using: :btree
  add_index "groups_agents", ["groups_id"], name: "ifk_rel_35", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "clients_id",                 null: false
    t.integer  "agents_id",                  null: false
    t.integer  "conversations_id",           null: false
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",            limit: 1
  end

  add_index "messages", ["agents_id"], name: "ifk_rel_41", using: :btree
  add_index "messages", ["agents_id"], name: "messages_fkindex2", using: :btree
  add_index "messages", ["clients_id"], name: "ifk_rel_42", using: :btree
  add_index "messages", ["clients_id"], name: "messages_fkindex3", using: :btree
  add_index "messages", ["conversations_id"], name: "ifk_rel_40", using: :btree
  add_index "messages", ["conversations_id"], name: "messages_fkindex1", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "tickets_id",              null: false
    t.integer  "agents_id",               null: false
    t.string   "subject",     limit: nil
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",       limit: 1
  end

  add_index "notifications", ["agents_id"], name: "ifk_rel_19", using: :btree
  add_index "notifications", ["agents_id"], name: "notifications_fkindex1", using: :btree
  add_index "notifications", ["tickets_id"], name: "ifk_rel_201", using: :btree
  add_index "notifications", ["tickets_id"], name: "notifications_fkindex2", using: :btree

  create_table "participants", force: true do |t|
    t.integer  "clients_id",                 null: false
    t.integer  "agents_id",                  null: false
    t.integer  "conversations_id",           null: false
    t.string   "is_online",        limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",            limit: 1
  end

  add_index "participants", ["agents_id"], name: "ifk_rel_38", using: :btree
  add_index "participants", ["agents_id"], name: "participants_fkindex2", using: :btree
  add_index "participants", ["clients_id"], name: "ifk_rel_39", using: :btree
  add_index "participants", ["clients_id"], name: "participants_fkindex3", using: :btree
  add_index "participants", ["conversations_id"], name: "ifk_rel_37", using: :btree
  add_index "participants", ["conversations_id"], name: "participants_fkindex1", using: :btree

  create_table "priorities", force: true do |t|
    t.string   "name",        limit: nil
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",       limit: 1
  end

  create_table "roles", force: true do |t|
    t.string   "name",        limit: nil, null: false
    t.text     "description",             null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "state",       limit: 1,   null: false
  end

  create_table "schedules", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",       limit: 1
  end

  create_table "scheldules_agents", force: true do |t|
    t.integer  "schedules_id",                                                                             null: false
    t.integer  "agents_id",                                                                                null: false
    t.string   "is_manager",   limit: 1
    t.integer  "created_at",             default: "nextval('scheldules_agents_created_at_seq'::regclass)", null: false
    t.datetime "updated_at"
    t.string   "state",        limit: 1
  end

  add_index "scheldules_agents", ["agents_id"], name: "ifk_rel_28", using: :btree
  add_index "scheldules_agents", ["agents_id"], name: "scheldules_agents_fkindex2", using: :btree
  add_index "scheldules_agents", ["schedules_id"], name: "ifk_rel_27", using: :btree
  add_index "scheldules_agents", ["schedules_id"], name: "scheldules_agents_fkindex1", using: :btree

  create_table "solutions", force: true do |t|
    t.string   "title",       limit: nil
    t.text     "description"
    t.string   "version",     limit: nil
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",       limit: 1
  end

  create_table "solutions_attachments", force: true do |t|
    t.integer  "attachments_id",                                                                                 null: false
    t.integer  "solutions_id",                                                                                   null: false
    t.integer  "created_at",               default: "nextval('solutions_attachments_created_at_seq'::regclass)", null: false
    t.datetime "updated_at"
    t.string   "state",          limit: 1
  end

  add_index "solutions_attachments", ["attachments_id"], name: "ifk_rel_32", using: :btree
  add_index "solutions_attachments", ["attachments_id"], name: "solutions_attachments_fkindex1", using: :btree
  add_index "solutions_attachments", ["solutions_id"], name: "ifk_rel_33", using: :btree
  add_index "solutions_attachments", ["solutions_id"], name: "solutions_attachments_fkindex2", using: :btree

  create_table "states", force: true do |t|
    t.string   "name",        limit: nil
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",       limit: 1
  end

  create_table "tickets", force: true do |t|
    t.integer  "priorities_id",             null: false
    t.integer  "clients_id",                null: false
    t.string   "title",         limit: nil, null: false
    t.text     "description",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "state",         limit: 1
  end

  add_index "tickets", ["clients_id"], name: "ifk_create", using: :btree
  add_index "tickets", ["clients_id"], name: "tickets_fkindex1", using: :btree
  add_index "tickets", ["priorities_id"], name: "ifk_rel_16", using: :btree
  add_index "tickets", ["priorities_id"], name: "tickets_fkindex2", using: :btree

  create_table "tickets_agents", force: true do |t|
    t.integer  "tickets_id",           null: false
    t.integer  "agents_id",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",      limit: 1
  end

  add_index "tickets_agents", ["agents_id"], name: "ifk_is_assigned_a", using: :btree
  add_index "tickets_agents", ["agents_id"], name: "tickets_agents_fkindex2", using: :btree
  add_index "tickets_agents", ["tickets_id"], name: "ifk_is_assigned_t", using: :btree
  add_index "tickets_agents", ["tickets_id"], name: "tickets_agents_fkindex1", using: :btree

  create_table "tickets_attachments", primary_key: "attachments_id", force: true do |t|
    t.integer  "tickets_id",                                                                               null: false
    t.integer  "created_at",           default: "nextval('tickets_attachments_created_at_seq'::regclass)", null: false
    t.datetime "updated_at"
    t.string   "state",      limit: 1,                                                                     null: false
  end

  add_index "tickets_attachments", ["attachments_id"], name: "ifk_rel_30", using: :btree
  add_index "tickets_attachments", ["attachments_id"], name: "tickets_attachments_fkindex1", using: :btree
  add_index "tickets_attachments", ["tickets_id"], name: "ifk_rel_31", using: :btree
  add_index "tickets_attachments", ["tickets_id"], name: "tickets_attachments_fkindex2", using: :btree

  create_table "tickets_categories", force: true do |t|
    t.integer  "categories_id",                                                                              null: false
    t.integer  "tickets_id",                                                                                 null: false
    t.integer  "created_at",              default: "nextval('tickets_categories_created_at_seq'::regclass)", null: false
    t.datetime "updated_at"
    t.string   "state",         limit: 1
  end

  add_index "tickets_categories", ["categories_id"], name: "ifk_rel_14", using: :btree
  add_index "tickets_categories", ["categories_id"], name: "tickets_categories_fkindex1", using: :btree
  add_index "tickets_categories", ["tickets_id"], name: "ifk_rel_15", using: :btree
  add_index "tickets_categories", ["tickets_id"], name: "tickets_categories_fkindex2", using: :btree

  create_table "tickets_groups", force: true do |t|
    t.integer  "groups_id",            null: false
    t.integer  "tickets_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",      limit: 1
  end

  add_index "tickets_groups", ["groups_id"], name: "ifk_is_assigned_g", using: :btree
  add_index "tickets_groups", ["groups_id"], name: "tickets_groups_fkindex1", using: :btree
  add_index "tickets_groups", ["tickets_id"], name: "ifk_is_assigned_t2", using: :btree
  add_index "tickets_groups", ["tickets_id"], name: "tickets_groups_fkindex2", using: :btree

  create_table "tickets_solutions", force: true do |t|
    t.integer  "tickets_id",                                                                               null: false
    t.integer  "solutions_id",                                                                             null: false
    t.integer  "created_at",             default: "nextval('tickets_solutions_created_at_seq'::regclass)", null: false
    t.datetime "updated_at"
    t.string   "state",        limit: 1
  end

  add_index "tickets_solutions", ["solutions_id"], name: "ifk_rel_26", using: :btree
  add_index "tickets_solutions", ["solutions_id"], name: "tickets_solutions_fkindex2", using: :btree
  add_index "tickets_solutions", ["tickets_id"], name: "ifk_rel_25", using: :btree
  add_index "tickets_solutions", ["tickets_id"], name: "tickets_solutions_fkindex1", using: :btree

  create_table "tickets_states", force: true do |t|
    t.integer  "states_id",                                                                           null: false
    t.integer  "tickets_id",                                                                          null: false
    t.string   "is_current", limit: 1
    t.integer  "created_at",           default: "nextval('tickets_states_created_at_seq'::regclass)", null: false
    t.datetime "updated_at"
    t.string   "state",      limit: 1
  end

  add_index "tickets_states", ["states_id"], name: "ifk_rel_11", using: :btree
  add_index "tickets_states", ["states_id"], name: "tickets_states_fkindex1", using: :btree
  add_index "tickets_states", ["tickets_id"], name: "ifk_rel_13", using: :btree
  add_index "tickets_states", ["tickets_id"], name: "tickets_states_fkindex2", using: :btree

end
