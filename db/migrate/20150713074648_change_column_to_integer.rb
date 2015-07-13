# change_column :table_name, :column_name, 'integer USING CAST(column_name AS integer)'

class ChangeColumnToInteger < ActiveRecord::Migration
  def change
    change_column :guests, :rsvp_status, 'integer USING CAST(rsvp_status AS integer) '
  end
end


