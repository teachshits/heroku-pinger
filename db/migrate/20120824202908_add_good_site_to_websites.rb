class AddGoodSiteToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :good_site, :boolean
  end
end
