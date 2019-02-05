# frozen_string_literal: true

class AddIdToBusinesstypeSpaces < ActiveRecord::Migration
  def change
    execute 'CREATE SEQUENCE businesstype_spaces_seq START 1;'
    add_column :businesstype_spaces, :id, :integer
    execute "ALTER TABLE businesstype_spaces ALTER COLUMN id SET DEFAULT NEXTVAL('businesstype_spaces_seq');"
  end
end
