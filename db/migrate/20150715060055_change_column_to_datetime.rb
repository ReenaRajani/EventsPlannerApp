class ChangeColumnToDatetime < ActiveRecord::Migration
  def change
    remove_column :events, :eventtime, :time
    rename_column :events, :eventdate, :eventdate_time
    change_column :events, :eventdate_time, :datetime 
  end
end
