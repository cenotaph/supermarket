class AddCountercachesToBusinesstypes < ActiveRecord::Migration
  def self.up
    add_column :businesstypes, :spaces_count, :integer, :default => 0
    add_column :organisationtypes, :spaces_count, :integer, :default => 0
    Businesstype.reset_column_information
    Businesstype.all.each do |bt|
      Businesstype.update_counters bt.id, :spaces_count => bt.spaces.length
    end
    Organisationtype.reset_column_information
    Organisationtype.all.each do |ot|
      Organisationtype.update_counters ot.id, :spaces_count => ot.spaces.length
    end
  end
  
  def self.down
    remove_column :businesstypes, :spaces_count
    remove_column :organisationtypes, :spaces_count
  end
end
