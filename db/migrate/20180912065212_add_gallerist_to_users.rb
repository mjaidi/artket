class AddGalleristToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gallerist, :boolean, default: false
  end
end
