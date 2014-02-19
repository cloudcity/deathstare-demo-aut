class ClientDevices < ActiveRecord::Migration
  def change
    create_table "client_devices", id: :uuid, force: true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end



