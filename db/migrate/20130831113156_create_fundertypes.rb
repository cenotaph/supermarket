# frozen_string_literal: true

class CreateFundertypes < ActiveRecord::Migration
  def change
    create_table :fundertypes do |t|
      t.string :name

      t.timestamps
    end
    execute("insert into fundertypes (name) values ('Main partner'), ('Cultural Institutes, Embassies, Foundations'),('Supporting our exhibitors'),('Cooperation partners'),('Media partners'),('Companies')")
  end
end
