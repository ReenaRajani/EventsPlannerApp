class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :email_id
      t.string :phone_no
      t.string :password_digest
      t.timestamps
      t.boolean :admin , :default => 'false'
    end
  end
end
