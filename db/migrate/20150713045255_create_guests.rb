class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.text :email_id
      t.string :phone_no
      t.string :rsvp_status
      t.timestamps
    end
  end
end
