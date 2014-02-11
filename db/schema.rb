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

ActiveRecord::Schema.define(version: 20140211162556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: true do |t|
  end

  create_table "activity_spaces", id: false, force: true do |t|
    t.integer "activity_id", null: false
    t.integer "space_id",    null: false
  end

  add_index "activity_spaces", ["activity_id"], name: "index_activity_spaces_activity", using: :btree
  add_index "activity_spaces", ["space_id"], name: "index_activity_spaces_space", using: :btree

  create_table "activity_translations", force: true do |t|
    t.string  "name",        limit: 50
    t.integer "activity_id",            null: false
    t.string  "locale",      limit: 50, null: false
  end

  add_index "activity_translations", ["activity_id", "locale"], name: "unique_activity_translations_locales", unique: true, using: :btree

  create_table "applicationcomments", force: true do |t|
    t.integer  "user_id"
    t.integer  "application_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicationcomments", ["application_id"], name: "index_applicationcomments_on_application_id", using: :btree
  add_index "applicationcomments", ["user_id"], name: "index_applicationcomments_on_user_id", using: :btree

  create_table "applicationlinks", force: true do |t|
    t.string   "url"
    t.text     "title"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicationlinks", ["application_id"], name: "index_applicationlinks_on_application_id", using: :btree

  create_table "applications", force: true do |t|
    t.integer  "year_id"
    t.string   "organisation_name"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "contact_moms"
    t.string   "contact_phone"
    t.string   "contact_address1"
    t.string   "contact_address2"
    t.string   "contact_city"
    t.string   "contact_postcode"
    t.string   "contact_country"
    t.string   "contact_email"
    t.text     "organisation_description"
    t.string   "exhibitor_address1"
    t.string   "exhibitor_address2"
    t.string   "exhibitor_city"
    t.string   "exhibitor_postcode"
    t.string   "exhibitor_country"
    t.string   "exhibitor_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "space_id"
    t.string   "status"
    t.string   "contact_state"
    t.string   "exhibitor_state"
    t.string   "hometown"
    t.string   "application_image"
    t.text     "staff",                     default: "Please pick suitable titles from these alternatives.\n\nMembers: If you have more than 20 members, just write the number of members.\nBoard:\nCo-directors:\nManagers:\nCo-founders:\n! DELETE ALTERNATIVES NOT USED\n"
    t.date     "submitted_at"
    t.text     "supermarket_proposal"
    t.integer  "booth_applied"
    t.integer  "booth_granted"
    t.boolean  "apply_to_malongen"
    t.text     "malongen_use"
    t.string   "upload1"
    t.string   "upload2"
    t.text     "special_needs"
    t.boolean  "need_darker_room"
    t.boolean  "wants_open_structure"
    t.string   "vat_number"
    t.boolean  "allow_late",                default: false,                                                                                                                                                                                                                    null: false
    t.integer  "applicationcomments_count", default: 0
    t.boolean  "red_spot"
    t.boolean  "accepted_terms"
    t.string   "accepting_name"
    t.datetime "notified_of_decision"
  end

  add_index "applications", ["year_id"], name: "index_applications_on_year_id", using: :btree

  create_table "applicationwebimages", force: true do |t|
    t.string   "imagefile"
    t.text     "title"
    t.integer  "sortorder"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicationwebimages", ["application_id"], name: "index_applicationwebimages_on_application_id", using: :btree

  create_table "attachments", force: true do |t|
    t.string "image"
  end

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "backgrounds", force: true do |t|
    t.string   "background_image"
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesstype_spaces", id: false, force: true do |t|
    t.integer "businesstype_id", null: false
    t.integer "space_id",        null: false
    t.integer "id"
  end

  add_index "businesstype_spaces", ["businesstype_id"], name: "index_businesstype_spaces_businesstype", using: :btree
  add_index "businesstype_spaces", ["space_id"], name: "index_businesstype_spaces_space", using: :btree

  create_table "businesstype_translations", force: true do |t|
    t.string  "name",            limit: 50
    t.integer "businesstype_id",            null: false
    t.string  "locale",          limit: 50, null: false
  end

  add_index "businesstype_translations", ["businesstype_id", "locale"], name: "unique_businesstype_translations_locales", unique: true, using: :btree

  create_table "businesstypes", force: true do |t|
    t.integer "spaces_count", default: 0
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
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

  create_table "contactdetails", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "moms"
    t.string   "contact_phone"
    t.string   "contact_post_town"
    t.string   "contact_postal_address"
    t.string   "contact_postcode"
    t.string   "country"
    t.string   "public_email"
    t.string   "public_phone"
    t.string   "public_post_town"
    t.string   "public_postal_address"
    t.string   "public_postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibitionspacetype_translations", force: true do |t|
    t.string  "name",                   limit: 50
    t.integer "exhibitionspacetype_id",            null: false
    t.string  "locale",                 limit: 50, null: false
  end

  add_index "exhibitionspacetype_translations", ["exhibitionspacetype_id", "locale"], name: "unique_exhibitionspacetype_translations_locales", unique: true, using: :btree

  create_table "exhibitionspacetypes", force: true do |t|
  end

  create_table "frontcarousels", force: true do |t|
    t.string   "image"
    t.boolean  "published"
    t.string   "link_to"
    t.string   "title"
    t.string   "caption"
    t.text     "customcss"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subsite_id"
  end

  add_index "frontcarousels", ["subsite_id"], name: "index_frontcarousels_on_subsite_id", using: :btree

  create_table "funders", force: true do |t|
    t.string   "logo"
    t.string   "name"
    t.string   "url"
    t.integer  "fundertype_id"
    t.integer  "sortorder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "funders", ["fundertype_id"], name: "index_funders_on_fundertype_id", using: :btree

  create_table "fundertypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "internallinks", force: true do |t|
    t.integer  "subsite_id"
    t.string   "controller"
    t.string   "action"
    t.string   "parameter"
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name"
    t.string   "custom_url"
  end

  add_index "internallinks", ["subsite_id"], name: "index_internallinks_on_subsite_id", using: :btree

  create_table "menu_hierarchies", force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "menu_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "menu_anc_desc_udx", unique: true, using: :btree
  add_index "menu_hierarchies", ["descendant_id"], name: "menu_desc_idx", using: :btree

  create_table "menus", force: true do |t|
    t.string   "item_type"
    t.integer  "item_id"
    t.integer  "sort_order"
    t.integer  "parent_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subsite_id"
    t.integer  "level"
    t.string   "url"
  end

  add_index "menus", ["subsite_id"], name: "index_menus_on_subsite_id", using: :btree

  create_table "organisationtype_spaces", id: false, force: true do |t|
    t.integer "organisationtype_id", null: false
    t.integer "space_id",            null: false
  end

  add_index "organisationtype_spaces", ["organisationtype_id"], name: "index_organisationtype_spaces_organisationtype", using: :btree
  add_index "organisationtype_spaces", ["space_id"], name: "index_organisationtype_spaces_space", using: :btree

  create_table "organisationtype_translations", force: true do |t|
    t.string  "name",                limit: 50
    t.integer "organisationtype_id",            null: false
    t.string  "locale",              limit: 50, null: false
  end

  add_index "organisationtype_translations", ["organisationtype_id", "locale"], name: "unique_organisationtype_translations_locales", unique: true, using: :btree

  create_table "organisationtypes", force: true do |t|
    t.integer "spaces_count", default: 0
  end

  create_table "page_hierarchies", force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "page_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "page_anc_desc_udx", unique: true, using: :btree
  add_index "page_hierarchies", ["descendant_id"], name: "page_desc_idx", using: :btree

  create_table "page_subsites", force: true do |t|
    t.integer "page_id"
    t.integer "subsite_id"
  end

  add_index "page_subsites", ["page_id", "subsite_id"], name: "index_page_subsites_on_page_id_and_subsite_id", unique: true, using: :btree

  create_table "page_translations", force: true do |t|
    t.string  "title",   limit: 50
    t.text    "body"
    t.integer "page_id",            null: false
    t.string  "locale",  limit: 50, null: false
  end

  add_index "page_translations", ["page_id", "locale"], name: "unique_page_translations_locales", unique: true, using: :btree

  create_table "pages", force: true do |t|
    t.boolean "is_frontpage"
    t.boolean "published"
    t.string  "slug"
    t.integer "parent_id"
    t.boolean "not_in_menu"
    t.string  "postimage"
    t.boolean "show_on_bottom",         default: false, null: false
    t.boolean "show_postimage_on_page", default: false, null: false
    t.string  "postticker_title"
    t.integer "background_id"
    t.boolean "is_private",             default: false, null: false
  end

  add_index "pages", ["background_id"], name: "index_pages_on_background_id", using: :btree

  create_table "post_translations", force: true do |t|
    t.integer  "post_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.text     "body"
  end

  add_index "post_translations", ["locale"], name: "index_post_translations_on_locale", using: :btree
  add_index "post_translations", ["post_id"], name: "index_post_translations_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "subsite_id"
    t.boolean  "promoted",            default: false, null: false
    t.boolean  "published",           default: false, null: false
    t.string   "slug"
    t.datetime "published_at"
    t.string   "postimage"
    t.integer  "posted_by_id"
    t.integer  "last_edited_by_id"
    t.boolean  "post_as_supermarket", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "dont_show_image",     default: false, null: false
  end

  add_index "posts", ["last_edited_by_id"], name: "index_posts_on_last_edited_by_id", using: :btree
  add_index "posts", ["posted_by_id"], name: "index_posts_on_posted_by_id", using: :btree
  add_index "posts", ["subsite_id"], name: "index_posts_on_subsite_id", using: :btree

  create_table "postslides", force: true do |t|
    t.string   "image"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_content_type"
    t.string   "caption"
    t.string   "credit"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postslides", ["post_id"], name: "index_postslides_on_post_id", using: :btree

  create_table "presslinks", force: true do |t|
    t.string   "title"
    t.string   "country"
    t.string   "url"
    t.date     "date_of_press"
    t.string   "attachment"
    t.integer  "year_id"
    t.integer  "subsite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
  end

  add_index "presslinks", ["subsite_id"], name: "index_presslinks_on_subsite_id", using: :btree
  add_index "presslinks", ["year_id"], name: "index_presslinks_on_year_id", using: :btree

  create_table "pressreleases", force: true do |t|
    t.string   "title"
    t.date     "date_of_release"
    t.text     "description"
    t.string   "attachment_eng"
    t.string   "attachment_swe"
    t.string   "image"
    t.boolean  "published"
    t.integer  "year_id"
    t.integer  "subsite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pressreleases", ["subsite_id"], name: "index_pressreleases_on_subsite_id", using: :btree
  add_index "pressreleases", ["year_id"], name: "index_pressreleases_on_year_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "slugs", force: true do |t|
    t.string   "name",                                  null: false
    t.integer  "sluggable_id"
    t.integer  "sequence",                  default: 1, null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 50
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sequence", "sluggable_type", "scope"], name: "index_slugs_index_slugs_on_n_s_s_and_s", using: :btree
  add_index "slugs", ["sluggable_id"], name: "index_slugs_sluggable_id", using: :btree

  create_table "space_users", force: true do |t|
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",       default: false
    t.string   "approval_token"
  end

  add_index "space_users", ["approval_token"], name: "index_space_users_on_approval_token", unique: true, using: :btree
  add_index "space_users", ["space_id", "user_id"], name: "index_space_users_on_space_id_and_user_id", unique: true, using: :btree
  add_index "space_users", ["space_id"], name: "index_space_users_on_space_id", using: :btree
  add_index "space_users", ["user_id"], name: "index_space_users_on_user_id", using: :btree

  create_table "spaces", force: true do |t|
    t.integer "lastpage",                                 default: 1
    t.string  "business_name",               limit: 250
    t.string  "businesstype_other",          limit: 50
    t.boolean "decisionmakers_organisation",              default: false
    t.boolean "decisionmakers_programming",               default: false
    t.string  "email"
    t.string  "address1"
    t.string  "address2"
    t.string  "city"
    t.string  "state",                       limit: 50
    t.string  "postcode",                    limit: 50
    t.string  "country"
    t.string  "phone",                       limit: 50
    t.string  "contact_email"
    t.string  "website1",                    limit: 50
    t.string  "website2",                    limit: 50
    t.string  "contact_person"
    t.string  "contact_phone",               limit: 50
    t.text    "short_description"
    t.string  "visiting_address1"
    t.string  "visiting_address2"
    t.string  "visiting_city"
    t.string  "visiting_state",              limit: 50
    t.string  "visiting_postcode",           limit: 50
    t.string  "visiting_country"
    t.float   "latitude"
    t.float   "longitude"
    t.integer "founding_year"
    t.boolean "is_active",                                default: true
    t.integer "year_of_closing"
    t.string  "exhibitions_per_year",        limit: 50
    t.integer "otheractivities_per_year"
    t.integer "percent_for_exhibitions"
    t.string  "exhibitors",                  limit: 50
    t.integer "percent_invited"
    t.string  "activities_other",            limit: 50
    t.string  "other_focus"
    t.string  "logo"
    t.boolean "approved",                                 default: false
    t.string  "image1"
    t.string  "image2"
    t.string  "image3"
    t.string  "image4"
    t.string  "image1_caption",              limit: 1024
    t.string  "image2_caption",              limit: 1024
    t.string  "image3_caption",              limit: 1024
    t.string  "image4_caption",              limit: 1024
    t.integer "exhibitionspacetype_id"
    t.string  "slug"
    t.string  "status"
  end

  add_index "spaces", ["exhibitionspacetype_id"], name: "index_spaces_exhibitionspacetype", using: :btree

  create_table "subsites", force: true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "timezone"
    t.string   "display_name"
    t.string   "password_salt"
    t.string   "remember_token"
    t.string   "photo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "videohosts", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videolinks", force: true do |t|
    t.text     "url"
    t.integer  "application_id"
    t.string   "video_provider"
    t.text     "title"
    t.string   "sortorder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videolinks", ["application_id"], name: "index_videolinks_on_application_id", using: :btree

  create_table "videos", force: true do |t|
    t.integer  "subsite_id"
    t.string   "provider_id"
    t.boolean  "published"
    t.integer  "year_id"
    t.string   "thumbnail"
    t.integer  "thumbnail_size"
    t.integer  "thumbnail_width"
    t.integer  "thumbnail_height"
    t.string   "thumbnail_content_type"
    t.integer  "video_width"
    t.integer  "video_height"
    t.integer  "duration"
    t.string   "title"
    t.text     "description"
    t.integer  "videohost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["subsite_id"], name: "index_videos_on_subsite_id", using: :btree
  add_index "videos", ["year_id"], name: "index_videos_on_year_id", using: :btree

  create_table "websites", force: true do |t|
    t.string   "url"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "space_id"
  end

  add_index "websites", ["application_id"], name: "index_websites_on_application_id", using: :btree

  create_table "years", force: true do |t|
    t.integer  "year"
    t.boolean  "published"
    t.boolean  "is_legacy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "applications_open", default: false, null: false
    t.boolean  "reveal_decisions",  default: false, null: false
    t.boolean  "allow_editing",     default: false, null: false
    t.text     "tv_description"
  end

end
