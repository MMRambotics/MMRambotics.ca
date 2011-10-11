class AddGCalendarIdColumnToPostings < ActiveRecord::Migration
  def change
    add_column :postings, :gcalendar_id, :string
    add_column :postings, :end_date, :datetime
  end
end
