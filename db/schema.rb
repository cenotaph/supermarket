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

ActiveRecord::Schema.define(version: 2019_10_31_104004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace", limit: 255
    t.text "body"
    t.string "resource_id", limit: 255, null: false
    t.string "resource_type", limit: 255, null: false
    t.integer "author_id"
    t.string "author_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "activities", id: :serial, force: :cascade do |t|
  end

  create_table "activity_spaces", primary_key: ["activity_id", "space_id"], force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "space_id", null: false
    t.index ["activity_id"], name: "index_activity_spaces_activity"
    t.index ["space_id"], name: "index_activity_spaces_space"
  end

  create_table "activity_translations", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50
    t.integer "activity_id", null: false
    t.string "locale", limit: 50, null: false
    t.index ["activity_id", "locale"], name: "unique_activity_translations_locales", unique: true
  end

  create_table "applicationcomments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "application_id"
    t.text "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["application_id"], name: "index_applicationcomments_on_application_id"
    t.index ["user_id"], name: "index_applicationcomments_on_user_id"
  end

  create_table "applicationlinks", id: :serial, force: :cascade do |t|
    t.string "url", limit: 255
    t.text "title"
    t.integer "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["application_id"], name: "index_applicationlinks_on_application_id"
  end

  create_table "applications", id: :serial, force: :cascade do |t|
    t.integer "year_id"
    t.string "organisation_name", limit: 255
    t.string "contact_first_name", limit: 255
    t.string "contact_last_name", limit: 255
    t.string "contact_moms", limit: 255
    t.string "contact_phone", limit: 255
    t.string "contact_address1", limit: 255
    t.string "contact_address2", limit: 255
    t.string "contact_city", limit: 255
    t.string "contact_postcode", limit: 255
    t.string "contact_country", limit: 255
    t.string "contact_email", limit: 255
    t.text "organisation_description"
    t.string "exhibitor_address1", limit: 255
    t.string "exhibitor_address2", limit: 255
    t.string "exhibitor_city", limit: 255
    t.string "exhibitor_postcode", limit: 255
    t.string "exhibitor_country", limit: 255
    t.string "exhibitor_phone", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.integer "space_id"
    t.string "status", limit: 255
    t.string "contact_state", limit: 255
    t.string "exhibitor_state", limit: 255
    t.string "hometown", limit: 255
    t.string "application_image", limit: 255
    t.text "staff"
    t.date "submitted_at"
    t.text "supermarket_proposal"
    t.integer "booth_applied"
    t.integer "booth_granted"
    t.boolean "apply_to_malongen"
    t.text "malongen_use"
    t.string "upload1", limit: 255
    t.string "upload2", limit: 255
    t.text "special_needs"
    t.boolean "need_darker_room"
    t.boolean "wants_open_structure"
    t.string "vat_number", limit: 255
    t.boolean "allow_late", default: false, null: false
    t.integer "applicationcomments_count", default: 0
    t.boolean "red_spot"
    t.boolean "accepted_terms"
    t.string "accepting_name", limit: 255
    t.datetime "notified_of_decision"
    t.boolean "networking_only", default: false, null: false
    t.text "text_2018"
    t.string "informal_country"
    t.boolean "wants_forum"
    t.index ["year_id"], name: "index_applications_on_year_id"
  end

  create_table "applicationwebimages", id: :serial, force: :cascade do |t|
    t.string "imagefile", limit: 255
    t.text "title"
    t.integer "sortorder"
    t.integer "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["application_id"], name: "index_applicationwebimages_on_application_id"
  end

  create_table "attachments", id: :serial, force: :cascade do |t|
    t.string "image", limit: 255
  end

  create_table "attendees", id: :serial, force: :cascade do |t|
    t.integer "year_id"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "organisation", limit: 255
    t.string "email", limit: 255
    t.string "verification_code", limit: 255
    t.boolean "arrival_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "vip", default: false, null: false
    t.string "guest_of"
    t.index ["verification_code"], name: "index_attendees_on_verification_code", unique: true
    t.index ["year_id"], name: "index_attendees_on_year_id"
  end

  create_table "authentications", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "provider", limit: 255
    t.string "uid", limit: 255
    t.string "username", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "backgrounds", id: :serial, force: :cascade do |t|
    t.string "background_image", limit: 255
    t.string "name", limit: 255
    t.boolean "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesstype_spaces", primary_key: ["businesstype_id", "space_id"], force: :cascade do |t|
    t.integer "businesstype_id", null: false
    t.integer "space_id", null: false
    t.integer "id", default: -> { "nextval('businesstype_spaces_seq'::regclass)" }
    t.index ["businesstype_id"], name: "index_businesstype_spaces_businesstype"
    t.index ["space_id"], name: "index_businesstype_spaces_space"
  end

  create_table "businesstype_translations", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50
    t.integer "businesstype_id", null: false
    t.string "locale", limit: 50, null: false
    t.index ["businesstype_id", "locale"], name: "unique_businesstype_translations_locales", unique: true
  end

  create_table "businesstypes", id: :serial, force: :cascade do |t|
    t.integer "spaces_count", default: 0
  end

  create_table "cashes", id: :serial, force: :cascade do |t|
    t.text "title"
    t.string "image"
    t.integer "image_size"
    t.integer "image_width"
    t.integer "image_height"
    t.string "image_content_type"
    t.string "source"
    t.string "link_url"
    t.text "content"
    t.integer "order"
    t.string "sourceid"
    t.integer "issued_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", limit: 255, null: false
    t.string "data_content_type", limit: 255
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "contactdetails", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "moms", limit: 255
    t.string "contact_phone", limit: 255
    t.string "contact_post_town", limit: 255
    t.string "contact_postal_address", limit: 255
    t.string "contact_postcode", limit: 255
    t.string "country", limit: 255
    t.string "public_email", limit: 255
    t.string "public_phone", limit: 255
    t.string "public_post_town", limit: 255
    t.string "public_postal_address", limit: 255
    t.string "public_postcode", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibitionspacetype_translations", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50
    t.integer "exhibitionspacetype_id", null: false
    t.string "locale", limit: 50, null: false
    t.index ["exhibitionspacetype_id", "locale"], name: "unique_exhibitionspacetype_translations_locales", unique: true
  end

  create_table "exhibitionspacetypes", id: :serial, force: :cascade do |t|
  end

  create_table "frontcarousels", id: :serial, force: :cascade do |t|
    t.string "image", limit: 255
    t.boolean "published"
    t.string "link_to", limit: 255
    t.string "title", limit: 255
    t.string "caption", limit: 255
    t.text "customcss"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "subsite_id"
    t.index ["subsite_id"], name: "index_frontcarousels_on_subsite_id"
  end

  create_table "funders", id: :serial, force: :cascade do |t|
    t.string "logo", limit: 255
    t.string "name", limit: 255
    t.string "url", limit: 255
    t.integer "fundertype_id"
    t.integer "sortorder"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["fundertype_id"], name: "index_funders_on_fundertype_id"
  end

  create_table "funders_years", id: false, force: :cascade do |t|
    t.integer "funder_id", null: false
    t.integer "year_id", null: false
  end

  create_table "fundertypes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "sort_order", default: 0.0, null: false
  end

  create_table "internallinks", id: :serial, force: :cascade do |t|
    t.integer "subsite_id"
    t.string "controller", limit: 255
    t.string "action", limit: 255
    t.string "parameter", limit: 255
    t.string "name", limit: 255
    t.boolean "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "display_name", limit: 255
    t.string "custom_url", limit: 255
    t.index ["subsite_id"], name: "index_internallinks_on_subsite_id"
  end

  create_table "menu_hierarchies", id: :serial, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "menu_anc_desc_udx", unique: true
    t.index ["descendant_id"], name: "menu_desc_idx"
  end

  create_table "menus", id: :serial, force: :cascade do |t|
    t.string "item_type", limit: 255
    t.integer "item_id"
    t.integer "sort_order"
    t.integer "parent_id"
    t.boolean "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "subsite_id"
    t.integer "level"
    t.string "url", limit: 255
    t.index ["subsite_id"], name: "index_menus_on_subsite_id"
  end

  create_table "organisationtype_spaces", primary_key: ["organisationtype_id", "space_id"], force: :cascade do |t|
    t.integer "organisationtype_id", null: false
    t.integer "space_id", null: false
    t.index ["organisationtype_id"], name: "index_organisationtype_spaces_organisationtype"
    t.index ["space_id"], name: "index_organisationtype_spaces_space"
  end

  create_table "organisationtype_translations", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50
    t.integer "organisationtype_id", null: false
    t.string "locale", limit: 50, null: false
    t.index ["organisationtype_id", "locale"], name: "unique_organisationtype_translations_locales", unique: true
  end

  create_table "organisationtypes", id: :serial, force: :cascade do |t|
    t.integer "spaces_count", default: 0
  end

  create_table "page_hierarchies", id: :serial, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "page_anc_desc_udx", unique: true
    t.index ["descendant_id"], name: "page_desc_idx"
  end

  create_table "page_subsites", id: :serial, force: :cascade do |t|
    t.integer "page_id"
    t.integer "subsite_id"
    t.index ["page_id", "subsite_id"], name: "index_page_subsites_on_page_id_and_subsite_id", unique: true
  end

  create_table "page_translations", id: :serial, force: :cascade do |t|
    t.string "title", limit: 50
    t.text "body"
    t.integer "page_id", null: false
    t.string "locale", limit: 50, null: false
    t.index ["page_id", "locale"], name: "unique_page_translations_locales", unique: true
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.boolean "is_frontpage"
    t.boolean "published"
    t.string "slug", limit: 255
    t.integer "parent_id"
    t.boolean "not_in_menu"
    t.string "postimage", limit: 255
    t.boolean "show_on_bottom", default: false, null: false
    t.boolean "show_postimage_on_page", default: false, null: false
    t.string "postticker_title", limit: 255
    t.integer "background_id"
    t.boolean "is_private", default: false, null: false
    t.index ["background_id"], name: "index_pages_on_background_id"
  end

  create_table "performanceapplicationcomments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "app_id"
    t.text "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["app_id"], name: "index_performanceapplicationcomments_on_app_id"
    t.index ["user_id"], name: "index_performanceapplicationcomments_on_user_id"
  end

  create_table "performanceapplications", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "year_id"
    t.string "contact_name", limit: 255
    t.string "contact_email", limit: 255
    t.string "contact_phone", limit: 255
    t.string "description", limit: 1000
    t.string "prep_time", limit: 255
    t.string "performance_time", limit: 255
    t.string "num_of_participants_on_stage", limit: 255
    t.string "number_of_participants_off_stage", limit: 255
    t.text "technical_requirements"
    t.string "weblink1", limit: 255
    t.string "weblink2", limit: 255
    t.string "weblink3", limit: 255
    t.string "weblink4", limit: 255
    t.string "connection_to_visual_arts", limit: 500
    t.integer "decision"
    t.string "attachment", limit: 255
    t.string "attachment_content_type", limit: 255
    t.string "attachment_file_size", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "number_of_assistants"
    t.text "additional_comments"
    t.string "city"
    t.string "country"
    t.string "assistants_prep"
    t.string "postcode"
    t.string "postal_address"
    t.index ["user_id"], name: "index_performanceapplications_on_user_id"
    t.index ["year_id"], name: "index_performanceapplications_on_year_id"
  end

  create_table "pnps", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "postal_address"
    t.string "city"
    t.string "country"
    t.string "postcode"
    t.string "organisation"
    t.string "other_organisations"
    t.string "others_from_same"
    t.boolean "programme_meetings"
    t.boolean "programme_party"
    t.boolean "programme_discussion"
    t.boolean "programme_lounge"
    t.boolean "programme_exhibitions"
    t.boolean "programme_exhibitors"
    t.boolean "programme_talks"
    t.boolean "programme_performances"
    t.boolean "hope_newpartners"
    t.boolean "hope_newknowledge"
    t.boolean "hope_othercountries"
    t.boolean "hope_exhibitionpossibilities"
    t.boolean "hope_supermarketoverall"
    t.integer "role_in_scene"
    t.string "languages"
    t.boolean "willing_to_do_survey"
    t.string "planning_to_write"
    t.text "other_comments"
    t.integer "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "delivering_talk"
    t.boolean "writing_about_supermarket"
    t.string "vegetable"
    t.boolean "supermarket_forum"
    t.boolean "hope_newcollabs"
    t.string "other_role_explanation"
    t.index ["year_id"], name: "index_pnps_on_year_id"
  end

  create_table "post_translations", id: :serial, force: :cascade do |t|
    t.integer "post_id", null: false
    t.string "locale", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "subject", limit: 255
    t.text "body"
    t.index ["locale"], name: "index_post_translations_on_locale"
    t.index ["post_id"], name: "index_post_translations_on_post_id"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.integer "subsite_id"
    t.boolean "promoted", default: false, null: false
    t.boolean "published", default: false, null: false
    t.string "slug", limit: 255
    t.datetime "published_at"
    t.string "postimage", limit: 255
    t.integer "posted_by_id"
    t.integer "last_edited_by_id"
    t.boolean "post_as_supermarket", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "dont_show_image", default: false, null: false
    t.index ["last_edited_by_id"], name: "index_posts_on_last_edited_by_id"
    t.index ["posted_by_id"], name: "index_posts_on_posted_by_id"
    t.index ["subsite_id"], name: "index_posts_on_subsite_id"
  end

  create_table "postslides", id: :serial, force: :cascade do |t|
    t.string "image", limit: 255
    t.integer "image_size"
    t.integer "image_width"
    t.integer "image_height"
    t.string "image_content_type", limit: 255
    t.string "caption", limit: 255
    t.string "credit", limit: 255
    t.integer "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["post_id"], name: "index_postslides_on_post_id"
  end

  create_table "presslinks", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.string "country", limit: 255
    t.string "url", limit: 255
    t.date "date_of_press"
    t.string "attachment", limit: 255
    t.integer "year_id"
    t.integer "subsite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "source", limit: 255
    t.index ["subsite_id"], name: "index_presslinks_on_subsite_id"
    t.index ["year_id"], name: "index_presslinks_on_year_id"
  end

  create_table "pressreleases", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.date "date_of_release"
    t.text "description"
    t.string "attachment_eng", limit: 255
    t.string "attachment_swe", limit: 255
    t.string "image", limit: 255
    t.boolean "published"
    t.integer "year_id"
    t.integer "subsite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["subsite_id"], name: "index_pressreleases_on_subsite_id"
    t.index ["year_id"], name: "index_pressreleases_on_year_id"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "resource_id"
    t.string "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "slugs", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "sluggable_id"
    t.integer "sequence", default: 1, null: false
    t.string "sluggable_type", limit: 50
    t.string "scope", limit: 50
    t.datetime "created_at"
    t.index ["name", "sequence", "sluggable_type", "scope"], name: "index_slugs_index_slugs_on_n_s_s_and_s"
    t.index ["sluggable_id"], name: "index_slugs_sluggable_id"
  end

  create_table "space_users", id: :serial, force: :cascade do |t|
    t.integer "space_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "approved", default: false
    t.string "approval_token", limit: 255
    t.index ["approval_token"], name: "index_space_users_on_approval_token", unique: true
    t.index ["space_id", "user_id"], name: "index_space_users_on_space_id_and_user_id", unique: true
    t.index ["space_id"], name: "index_space_users_on_space_id"
    t.index ["user_id"], name: "index_space_users_on_user_id"
  end

  create_table "spacecomments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "space_id"
    t.text "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["space_id"], name: "index_spacecomments_on_space_id"
    t.index ["user_id"], name: "index_spacecomments_on_user_id"
  end

  create_table "spaces", id: :serial, force: :cascade do |t|
    t.integer "lastpage", default: 1
    t.string "business_name", limit: 250
    t.string "businesstype_other", limit: 50
    t.boolean "decisionmakers_organisation", default: false
    t.boolean "decisionmakers_programming", default: false
    t.string "email", limit: 255
    t.string "address1", limit: 255
    t.string "address2", limit: 255
    t.string "city", limit: 255
    t.string "state", limit: 50
    t.string "postcode", limit: 50
    t.string "country", limit: 255
    t.string "phone", limit: 50
    t.string "contact_email", limit: 255
    t.string "website1", limit: 50
    t.string "website2", limit: 50
    t.string "contact_person", limit: 255
    t.string "contact_phone", limit: 50
    t.text "short_description"
    t.string "visiting_address1", limit: 255
    t.string "visiting_address2", limit: 255
    t.string "visiting_city", limit: 255
    t.string "visiting_state", limit: 50
    t.string "visiting_postcode", limit: 50
    t.string "visiting_country", limit: 255
    t.float "latitude"
    t.float "longitude"
    t.integer "founding_year"
    t.boolean "is_active", default: true
    t.integer "year_of_closing"
    t.string "exhibitions_per_year", limit: 50
    t.integer "otheractivities_per_year"
    t.integer "percent_for_exhibitions"
    t.string "exhibitors", limit: 50
    t.integer "percent_invited"
    t.string "activities_other", limit: 50
    t.string "other_focus", limit: 255
    t.string "logo", limit: 255
    t.boolean "approved", default: false
    t.string "image1", limit: 255
    t.string "image2", limit: 255
    t.string "image3", limit: 255
    t.string "image4", limit: 255
    t.string "image1_caption", limit: 1024
    t.string "image2_caption", limit: 1024
    t.string "image3_caption", limit: 1024
    t.string "image4_caption", limit: 1024
    t.integer "exhibitionspacetype_id"
    t.string "slug", limit: 255
    t.string "status", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "denied", default: false, null: false
    t.integer "denied_by"
    t.boolean "interested_2016"
    t.index ["exhibitionspacetype_id"], name: "index_spaces_exhibitionspacetype"
  end

  create_table "subsites", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "subdomain", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "timezone", limit: 255
    t.string "display_name", limit: 255
    t.string "password_salt", limit: 255
    t.string "remember_token", limit: 255
    t.string "photo", limit: 255
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  create_table "videohosts", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videolinks", id: :serial, force: :cascade do |t|
    t.text "url"
    t.integer "application_id"
    t.string "video_provider", limit: 255
    t.text "title"
    t.string "sortorder", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["application_id"], name: "index_videolinks_on_application_id"
  end

  create_table "videos", id: :serial, force: :cascade do |t|
    t.integer "subsite_id"
    t.string "provider_id", limit: 255
    t.boolean "published"
    t.integer "year_id"
    t.string "thumbnail", limit: 255
    t.integer "thumbnail_size"
    t.integer "thumbnail_width"
    t.integer "thumbnail_height"
    t.string "thumbnail_content_type", limit: 255
    t.integer "video_width"
    t.integer "video_height"
    t.integer "duration"
    t.string "title", limit: 255
    t.text "description"
    t.integer "videohost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["subsite_id"], name: "index_videos_on_subsite_id"
    t.index ["year_id"], name: "index_videos_on_year_id"
  end

  create_table "websites", id: :serial, force: :cascade do |t|
    t.string "url", limit: 255
    t.integer "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "space_id"
    t.index ["application_id"], name: "index_websites_on_application_id"
  end

  create_table "years", id: :serial, force: :cascade do |t|
    t.integer "year"
    t.boolean "published"
    t.boolean "is_legacy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "applications_open", default: false, null: false
    t.boolean "reveal_decisions", default: false, null: false
    t.boolean "allow_editing", default: false, null: false
    t.text "tv_description"
    t.text "header_html"
    t.text "footer_html"
    t.text "above_carousel_html"
    t.boolean "center_above_carousel_text"
    t.date "registration_deadline"
  end

  add_foreign_key "pnps", "years"
end
