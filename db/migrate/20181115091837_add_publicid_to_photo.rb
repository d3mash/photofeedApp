class AddPublicidToPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :public_id, :text
  end
end
