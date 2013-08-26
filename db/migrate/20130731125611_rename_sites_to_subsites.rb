class RenameSitesToSubsites < ActiveRecord::Migration
  def change
    rename_table :sites, :subsites
    rename_table :page_sites, :page_subsites
    rename_column :page_subsites, :site_id, :subsite_id
    execute("INSERT INTO subsites (name, subdomain) VALUES ('supermarket2014', 'www')")
  end
end
