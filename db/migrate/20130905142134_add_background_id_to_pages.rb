class AddBackgroundIdToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :background, index: true
  end
end
