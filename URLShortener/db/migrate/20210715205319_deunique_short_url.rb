class DeuniqueShortUrl < ActiveRecord::Migration[5.2]
  def change
    remove_index :shortened_urls, :short_url
  end
end
