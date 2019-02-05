# frozen_string_literal: true

class ChangeStaffDefault < ActiveRecord::Migration
  def change
    execute('alter table applications alter column staff set default null')
  end
end
