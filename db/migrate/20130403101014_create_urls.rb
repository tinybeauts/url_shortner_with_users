require_relative "../../config/database"

class CreateUrls < ActiveRecord::Migration
  def change
     create_table :urls do |url|
      url.string :url, :key
      url.timestamps
    end
  end
end
