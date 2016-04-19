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

ActiveRecord::Schema.define(version: 20160419151342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: :cascade do |t|
  end

  create_table "activity_spaces", id: false, force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "space_id",    null: false
  end

  add_index "activity_spaces", ["activity_id"], name: "index_activity_spaces_activity", using: :btree
  add_index "activity_spaces", ["space_id"], name: "index_activity_spaces_space", using: :btree

  create_table "activity_translations", force: :cascade do |t|
    t.string  "name",        limit: 50
    t.integer "activity_id",            null: false
    t.string  "locale",      limit: 50, null: false
  end

  add_index "activity_translations", ["activity_id", "locale"], name: "unique_activity_translations_locales", unique: true, using: :btree

  create_table "applicationcomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "application_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicationcomments", ["application_id"], name: "index_applicationcomments_on_application_id", using: :btree
  add_index "applicationcomments", ["user_id"], name: "index_applicationcomments_on_user_id", using: :btree

  create_table "applicationlinks", force: :cascade do |t|
    t.string   "url",            limit: 255
    t.text     "title"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicationlinks", ["application_id"], name: "index_applicationlinks_on_application_id", using: :btree

  create_table "applications", force: :cascade do |t|
    t.integer  "year_id"
    t.string   "organisation_name",         limit: 255
    t.string   "contact_first_name",        limit: 255
    t.string   "contact_last_name",         limit: 255
    t.string   "contact_moms",              limit: 255
    t.string   "contact_phone",             limit: 255
    t.string   "contact_address1",          limit: 255
    t.string   "contact_address2",          limit: 255
    t.string   "contact_city",              limit: 255
    t.string   "contact_postcode",          limit: 255
    t.string   "contact_country",           limit: 255
    t.string   "contact_email",             limit: 255
    t.text     "organisation_description"
    t.string   "exhibitor_address1",        limit: 255
    t.string   "exhibitor_address2",        limit: 255
    t.string   "exhibitor_city",            limit: 255
    t.string   "exhibitor_postcode",        limit: 255
    t.string   "exhibitor_country",         limit: 255
    t.string   "exhibitor_phone",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "space_id"
    t.string   "status",                    limit: 255
    t.string   "contact_state",             limit: 255
    t.string   "exhibitor_state",           limit: 255
    t.string   "hometown",                  limit: 255
    t.string   "application_image",         limit: 255
    t.text     "staff"
    t.date     "submitted_at"
    t.text     "supermarket_proposal"
    t.integer  "booth_applied"
    t.integer  "booth_granted"
    t.boolean  "apply_to_malongen"
    t.text     "malongen_use"
    t.string   "upload1",                   limit: 255
    t.string   "upload2",                   limit: 255
    t.text     "special_needs"
    t.boolean  "need_darker_room"
    t.boolean  "wants_open_structure"
    t.string   "vat_number",                limit: 255
    t.boolean  "allow_late",                            default: false, null: false
    t.integer  "applicationcomments_count",             default: 0
    t.boolean  "red_spot"
    t.boolean  "accepted_terms"
    t.string   "accepting_name",            limit: 255
    t.datetime "notified_of_decision"
    t.boolean  "networking_only",                       default: false, null: false
  end

  add_index "applications", ["year_id"], name: "index_applications_on_year_id", using: :btree

  create_table "applicationwebimages", force: :cascade do |t|
    t.string   "imagefile",      limit: 255
    t.text     "title"
    t.integer  "sortorder"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicationwebimages", ["application_id"], name: "index_applicationwebimages_on_application_id", using: :btree

  create_table "attachments", force: :cascade do |t|
    t.string "image", limit: 255
  end

  create_table "attendees", force: :cascade do |t|
    t.integer  "year_id"
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.string   "organisation",      limit: 255
    t.string   "email",             limit: 255
    t.string   "verification_code", limit: 255
    t.boolean  "arrival_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "vip",                           default: false, null: false
    t.string   "guest_of"
  end

  add_index "attendees", ["verification_code"], name: "index_attendees_on_verification_code", unique: true, using: :btree
  add_index "attendees", ["year_id"], name: "index_attendees_on_year_id", using: :btree

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.string   "username",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "backgrounds", force: :cascade do |t|
    t.string   "background_image", limit: 255
    t.string   "name",             limit: 255
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesstype_spaces", id: false, force: :cascade do |t|
    t.integer "businesstype_id",                                                          null: false
    t.integer "space_id",                                                                 null: false
    t.integer "id",              default: "nextval('businesstype_spaces_seq'::regclass)"
  end

  add_index "businesstype_spaces", ["businesstype_id"], name: "index_businesstype_spaces_businesstype", using: :btree
  add_index "businesstype_spaces", ["space_id"], name: "index_businesstype_spaces_space", using: :btree

  create_table "businesstype_translations", force: :cascade do |t|
    t.string  "name",            limit: 50
    t.integer "businesstype_id",            null: false
    t.string  "locale",          limit: 50, null: false
  end

  add_index "businesstype_translations", ["businesstype_id", "locale"], name: "unique_businesstype_translations_locales", unique: true, using: :btree

  create_table "businesstypes", force: :cascade do |t|
    t.integer "spaces_count", default: 0
  end

  create_table "cashes", force: :cascade do |t|
    t.text     "title"
    t.string   "image"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_content_type"
    t.string   "source"
    t.string   "link_url"
    t.text     "content"
    t.integer  "order"
    t.string   "sourceid"
    t.integer  "issued_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contactdetails", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "moms",                   limit: 255
    t.string   "contact_phone",          limit: 255
    t.string   "contact_post_town",      limit: 255
    t.string   "contact_postal_address", limit: 255
    t.string   "contact_postcode",       limit: 255
    t.string   "country",                limit: 255
    t.string   "public_email",           limit: 255
    t.string   "public_phone",           limit: 255
    t.string   "public_post_town",       limit: 255
    t.string   "public_postal_address",  limit: 255
    t.string   "public_postcode",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibitionspacetype_translations", force: :cascade do |t|
    t.string  "name",                   limit: 50
    t.integer "exhibitionspacetype_id",            null: false
    t.string  "locale",                 limit: 50, null: false
  end

  add_index "exhibitionspacetype_translations", ["exhibitionspacetype_id", "locale"], name: "unique_exhibitionspacetype_translations_locales", unique: true, using: :btree

  create_table "exhibitionspacetypes", force: :cascade do |t|
  end

  create_table "frontcarousels", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.boolean  "published"
    t.string   "link_to",    limit: 255
    t.string   "title",      limit: 255
    t.string   "caption",    limit: 255
    t.text     "customcss"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subsite_id"
  end

  add_index "frontcarousels", ["subsite_id"], name: "index_frontcarousels_on_subsite_id", using: :btree

  create_table "funders", force: :cascade do |t|
    t.string   "logo",          limit: 255
    t.string   "name",          limit: 255
    t.string   "url",           limit: 255
    t.integer  "fundertype_id"
    t.integer  "sortorder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "funders", ["fundertype_id"], name: "index_funders_on_fundertype_id", using: :btree

  create_table "funders_years", id: false, force: :cascade do |t|
    t.integer "funder_id", null: false
    t.integer "year_id",   null: false
  end

  create_table "fundertypes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "sort_order",             default: 0.0, null: false
  end

  create_table "internallinks", force: :cascade do |t|
    t.integer  "subsite_id"
    t.string   "controller",   limit: 255
    t.string   "action",       limit: 255
    t.string   "parameter",    limit: 255
    t.string   "name",         limit: 255
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name", limit: 255
    t.string   "custom_url",   limit: 255
  end

  add_index "internallinks", ["subsite_id"], name: "index_internallinks_on_subsite_id", using: :btree

  create_table "menu_hierarchies", force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "menu_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "menu_anc_desc_udx", unique: true, using: :btree
  add_index "menu_hierarchies", ["descendant_id"], name: "menu_desc_idx", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "item_type",  limit: 255
    t.integer  "item_id"
    t.integer  "sort_order"
    t.integer  "parent_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subsite_id"
    t.integer  "level"
    t.string   "url",        limit: 255
  end

  add_index "menus", ["subsite_id"], name: "index_menus_on_subsite_id", using: :btree

  create_table "organisationtype_spaces", id: false, force: :cascade do |t|
    t.integer "organisationtype_id", null: false
    t.integer "space_id",            null: false
  end

  add_index "organisationtype_spaces", ["organisationtype_id"], name: "index_organisationtype_spaces_organisationtype", using: :btree
  add_index "organisationtype_spaces", ["space_id"], name: "index_organisationtype_spaces_space", using: :btree

  create_table "organisationtype_translations", force: :cascade do |t|
    t.string  "name",                limit: 50
    t.integer "organisationtype_id",            null: false
    t.string  "locale",              limit: 50, null: false
  end

  add_index "organisationtype_translations", ["organisationtype_id", "locale"], name: "unique_organisationtype_translations_locales", unique: true, using: :btree

  create_table "organisationtypes", force: :cascade do |t|
    t.integer "spaces_count", default: 0
  end

  create_table "page_hierarchies", force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "page_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "page_anc_desc_udx", unique: true, using: :btree
  add_index "page_hierarchies", ["descendant_id"], name: "page_desc_idx", using: :btree

  create_table "page_subsites", force: :cascade do |t|
    t.integer "page_id"
    t.integer "subsite_id"
  end

  add_index "page_subsites", ["page_id", "subsite_id"], name: "index_page_subsites_on_page_id_and_subsite_id", unique: true, using: :btree

  create_table "page_translations", force: :cascade do |t|
    t.string  "title",   limit: 50
    t.text    "body"
    t.integer "page_id",            null: false
    t.string  "locale",  limit: 50, null: false
  end

  add_index "page_translations", ["page_id", "locale"], name: "unique_page_translations_locales", unique: true, using: :btree

  create_table "pages", force: :cascade do |t|
    t.boolean "is_frontpage"
    t.boolean "published"
    t.string  "slug",                   limit: 255
    t.integer "parent_id"
    t.boolean "not_in_menu"
    t.string  "postimage",              limit: 255
    t.boolean "show_on_bottom",                     default: false, null: false
    t.boolean "show_postimage_on_page",             default: false, null: false
    t.string  "postticker_title",       limit: 255
    t.integer "background_id"
    t.boolean "is_private",                         default: false, null: false
  end

  add_index "pages", ["background_id"], name: "index_pages_on_background_id", using: :btree

  create_table "performanceapplicationcomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "app_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "performanceapplicationcomments", ["app_id"], name: "index_performanceapplicationcomments_on_app_id", using: :btree
  add_index "performanceapplicationcomments", ["user_id"], name: "index_performanceapplicationcomments_on_user_id", using: :btree

  create_table "performanceapplications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "year_id"
    t.string   "contact_name",                     limit: 255
    t.string   "contact_email",                    limit: 255
    t.string   "contact_phone",                    limit: 255
    t.string   "description",                      limit: 1000
    t.string   "prep_time",                        limit: 255
    t.string   "performance_time",                 limit: 255
    t.string   "num_of_participants_on_stage",     limit: 255
    t.string   "number_of_participants_off_stage", limit: 255
    t.text     "technical_requirements"
    t.string   "weblink1",                         limit: 255
    t.string   "weblink2",                         limit: 255
    t.string   "weblink3",                         limit: 255
    t.string   "weblink4",                         limit: 255
    t.string   "connection_to_visual_arts",        limit: 500
    t.integer  "decision"
    t.string   "attachment",                       limit: 255
    t.string   "attachment_content_type",          limit: 255
    t.string   "attachment_file_size",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "performanceapplications", ["user_id"], name: "index_performanceapplications_on_user_id", using: :btree
  add_index "performanceapplications", ["year_id"], name: "index_performanceapplications_on_year_id", using: :btree

  create_table "pnps", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "postal_address"
    t.string   "city"
    t.string   "country"
    t.string   "postcode"
    t.string   "organisation"
    t.string   "other_organisations"
    t.string   "others_from_same"
    t.boolean  "programme_meetings"
    t.boolean  "programme_party"
    t.boolean  "programme_discussion"
    t.boolean  "programme_lounge"
    t.boolean  "programme_exhibitions"
    t.boolean  "programme_exhibitors"
    t.boolean  "programme_talks"
    t.boolean  "programme_performances"
    t.boolean  "hope_newpartners"
    t.boolean  "hope_newknowledge"
    t.boolean  "hope_othercountries"
    t.boolean  "hope_exhibitionpossibilities"
    t.boolean  "hope_supermarketoverall"
    t.integer  "role_in_scene"
    t.string   "languages"
    t.boolean  "willing_to_do_survey"
    t.string   "planning_to_write"
    t.text     "other_comments"
    t.integer  "year_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "pnps", ["year_id"], name: "index_pnps_on_year_id", using: :btree

  create_table "post_translations", force: :cascade do |t|
    t.integer  "post_id",                null: false
    t.string   "locale",     limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject",    limit: 255
    t.text     "body"
  end

  add_index "post_translations", ["locale"], name: "index_post_translations_on_locale", using: :btree
  add_index "post_translations", ["post_id"], name: "index_post_translations_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "subsite_id"
    t.boolean  "promoted",                        default: false, null: false
    t.boolean  "published",                       default: false, null: false
    t.string   "slug",                limit: 255
    t.datetime "published_at"
    t.string   "postimage",           limit: 255
    t.integer  "posted_by_id"
    t.integer  "last_edited_by_id"
    t.boolean  "post_as_supermarket",             default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "dont_show_image",                 default: false, null: false
  end

  add_index "posts", ["last_edited_by_id"], name: "index_posts_on_last_edited_by_id", using: :btree
  add_index "posts", ["posted_by_id"], name: "index_posts_on_posted_by_id", using: :btree
  add_index "posts", ["subsite_id"], name: "index_posts_on_subsite_id", using: :btree

  create_table "postslides", force: :cascade do |t|
    t.string   "image",              limit: 255
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_content_type", limit: 255
    t.string   "caption",            limit: 255
    t.string   "credit",             limit: 255
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postslides", ["post_id"], name: "index_postslides_on_post_id", using: :btree

  create_table "presslinks", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "country",       limit: 255
    t.string   "url",           limit: 255
    t.date     "date_of_press"
    t.string   "attachment",    limit: 255
    t.integer  "year_id"
    t.integer  "subsite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source",        limit: 255
  end

  add_index "presslinks", ["subsite_id"], name: "index_presslinks_on_subsite_id", using: :btree
  add_index "presslinks", ["year_id"], name: "index_presslinks_on_year_id", using: :btree

  create_table "pressreleases", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.date     "date_of_release"
    t.text     "description"
    t.string   "attachment_eng",  limit: 255
    t.string   "attachment_swe",  limit: 255
    t.string   "image",           limit: 255
    t.boolean  "published"
    t.integer  "year_id"
    t.integer  "subsite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pressreleases", ["subsite_id"], name: "index_pressreleases_on_subsite_id", using: :btree
  add_index "pressreleases", ["year_id"], name: "index_pressreleases_on_year_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id"
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "slugs", force: :cascade do |t|
    t.string   "name",           limit: 255,             null: false
    t.integer  "sluggable_id"
    t.integer  "sequence",                   default: 1, null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 50
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sequence", "sluggable_type", "scope"], name: "index_slugs_index_slugs_on_n_s_s_and_s", using: :btree
  add_index "slugs", ["sluggable_id"], name: "index_slugs_sluggable_id", using: :btree

  create_table "space_users", force: :cascade do |t|
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",                   default: false
    t.string   "approval_token", limit: 255
  end

  add_index "space_users", ["approval_token"], name: "index_space_users_on_approval_token", unique: true, using: :btree
  add_index "space_users", ["space_id", "user_id"], name: "index_space_users_on_space_id_and_user_id", unique: true, using: :btree
  add_index "space_users", ["space_id"], name: "index_space_users_on_space_id", using: :btree
  add_index "space_users", ["user_id"], name: "index_space_users_on_user_id", using: :btree

  create_table "spacecomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "space_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spacecomments", ["space_id"], name: "index_spacecomments_on_space_id", using: :btree
  add_index "spacecomments", ["user_id"], name: "index_spacecomments_on_user_id", using: :btree

  create_table "spaces", force: :cascade do |t|
    t.integer  "lastpage",                                 default: 1
    t.string   "business_name",               limit: 250
    t.string   "businesstype_other",          limit: 50
    t.boolean  "decisionmakers_organisation",              default: false
    t.boolean  "decisionmakers_programming",               default: false
    t.string   "email",                       limit: 255
    t.string   "address1",                    limit: 255
    t.string   "address2",                    limit: 255
    t.string   "city",                        limit: 255
    t.string   "state",                       limit: 50
    t.string   "postcode",                    limit: 50
    t.string   "country",                     limit: 255
    t.string   "phone",                       limit: 50
    t.string   "contact_email",               limit: 255
    t.string   "website1",                    limit: 50
    t.string   "website2",                    limit: 50
    t.string   "contact_person",              limit: 255
    t.string   "contact_phone",               limit: 50
    t.text     "short_description"
    t.string   "visiting_address1",           limit: 255
    t.string   "visiting_address2",           limit: 255
    t.string   "visiting_city",               limit: 255
    t.string   "visiting_state",              limit: 50
    t.string   "visiting_postcode",           limit: 50
    t.string   "visiting_country",            limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "founding_year"
    t.boolean  "is_active",                                default: true
    t.integer  "year_of_closing"
    t.string   "exhibitions_per_year",        limit: 50
    t.integer  "otheractivities_per_year"
    t.integer  "percent_for_exhibitions"
    t.string   "exhibitors",                  limit: 50
    t.integer  "percent_invited"
    t.string   "activities_other",            limit: 50
    t.string   "other_focus",                 limit: 255
    t.string   "logo",                        limit: 255
    t.boolean  "approved",                                 default: false
    t.string   "image1",                      limit: 255
    t.string   "image2",                      limit: 255
    t.string   "image3",                      limit: 255
    t.string   "image4",                      limit: 255
    t.string   "image1_caption",              limit: 1024
    t.string   "image2_caption",              limit: 1024
    t.string   "image3_caption",              limit: 1024
    t.string   "image4_caption",              limit: 1024
    t.integer  "exhibitionspacetype_id"
    t.string   "slug",                        limit: 255
    t.string   "status",                      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "denied",                                   default: false, null: false
    t.integer  "denied_by"
    t.boolean  "interested_2016"
  end

  add_index "spaces", ["exhibitionspacetype_id"], name: "index_spaces_exhibitionspacetype", using: :btree

  create_table "subsites", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "subdomain",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "timezone",               limit: 255
    t.string   "display_name",           limit: 255
    t.string   "password_salt",          limit: 255
    t.string   "remember_token",         limit: 255
    t.string   "photo",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "videohosts", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videolinks", force: :cascade do |t|
    t.text     "url"
    t.integer  "application_id"
    t.string   "video_provider", limit: 255
    t.text     "title"
    t.string   "sortorder",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videolinks", ["application_id"], name: "index_videolinks_on_application_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "subsite_id"
    t.string   "provider_id",            limit: 255
    t.boolean  "published"
    t.integer  "year_id"
    t.string   "thumbnail",              limit: 255
    t.integer  "thumbnail_size"
    t.integer  "thumbnail_width"
    t.integer  "thumbnail_height"
    t.string   "thumbnail_content_type", limit: 255
    t.integer  "video_width"
    t.integer  "video_height"
    t.integer  "duration"
    t.string   "title",                  limit: 255
    t.text     "description"
    t.integer  "videohost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["subsite_id"], name: "index_videos_on_subsite_id", using: :btree
  add_index "videos", ["year_id"], name: "index_videos_on_year_id", using: :btree

  create_table "websites", force: :cascade do |t|
    t.string   "url",            limit: 255
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "space_id"
  end

  add_index "websites", ["application_id"], name: "index_websites_on_application_id", using: :btree

  create_table "years", force: :cascade do |t|
    t.integer  "year"
    t.boolean  "published"
    t.boolean  "is_legacy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "applications_open",          default: false, null: false
    t.boolean  "reveal_decisions",           default: false, null: false
    t.boolean  "allow_editing",              default: false, null: false
    t.text     "tv_description"
    t.text     "header_html"
    t.text     "footer_html"
    t.text     "above_carousel_html"
    t.boolean  "center_above_carousel_text"
    t.date     "registration_deadline"
  end

  add_foreign_key "pnps", "years"
end
