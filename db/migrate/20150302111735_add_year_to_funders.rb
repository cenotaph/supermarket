class AddYearToFunders < ActiveRecord::Migration
  def change
    create_join_table :funders, :years
    Funder.all.each do |f|
      f.years << Year.find(1)
      f.save
    end
  end

end
