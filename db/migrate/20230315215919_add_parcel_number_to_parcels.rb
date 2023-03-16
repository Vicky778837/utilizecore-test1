class AddParcelNumberToParcels < ActiveRecord::Migration[6.1]
  def change
    add_column :parcels, :parcel_number, :string
  end
end
