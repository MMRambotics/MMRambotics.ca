class Feedback < ActiveRecord::Base
  def self.person_categories
    ["Interested Student", "FIRST Student", "FIRST Mentor", "Past FIRST Participant", "Parent", "Sponsor", "Other"]
  end
end
