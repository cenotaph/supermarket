Ckeditor.setup do |config|
  require "ckeditor/orm/active_record"
  # //cdn.ckeditor.com/<version.number>/<distribution>/ckeditor.js
  config.cdn_url = "//cdn.ckeditor.com/4.6.1/basic/ckeditor.js"
end