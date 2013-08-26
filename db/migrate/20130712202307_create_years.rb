class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :year
      t.boolean :published
      t.boolean :is_legacy

      t.timestamps
    end
    2014.downto(2010).each do |year|
      execute("INSERT INTO years (year, published, is_legacy) VALUES (#{year.to_s}, true, true)")
    end
    execute("UPDATE years SET is_legacy=false where year = 2014")
  end
end
