class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventName
      t.text :occasion
      t.date :eventdate
      t.time :eventtime
      t.string :address
      t.string :invitation
      t.timestamps
    end
  end
end
