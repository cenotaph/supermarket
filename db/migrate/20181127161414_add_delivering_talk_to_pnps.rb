class AddDeliveringTalkToPnps < ActiveRecord::Migration
  def change
    add_column :pnps, :delivering_talk, :boolean
    add_column :pnps, :writing_about_supermarket, :boolean
    add_column :pnps, :vegetable, :string
  end
end
