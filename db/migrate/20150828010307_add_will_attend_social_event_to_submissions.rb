class AddWillAttendSocialEventToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :will_attend_social_event, :boolean, default: false
  end
end
