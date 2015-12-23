class AddAuthorIdColumnToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :author_id, :integer
  end
end
