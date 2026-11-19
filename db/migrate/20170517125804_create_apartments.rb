class CreateApartments < ActiveRecord::Migration[5.1]
logger           = ActiveSupport::Logger.new(STDOUT)
  def change
	warn("[ERROR] >>> Entering change()")
    create_table :apartments do |t|
      t.string :room_number, null: false
      t.integer :status, default: 0
      t.decimal :price, precision: 8, scale: 2
      t.text :description
      t.integer :room_type, default: 0
      t.integer :occupancy, default: 1
      t.integer :user_id, index: true
	warn("[WARN] <<< Exiting change()")
      t.timestamps
    end
  end
end
