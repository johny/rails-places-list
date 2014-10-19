class City < ActiveRecord::Base

  has_many :places

  extend FriendlyId
  friendly_id :name, use: :slugged

  include Workflow
  workflow do
    state :disabled do
      event :enable, :transitions_to => :enabled
    end
    state :enabled do
      event :disable, :transitions_to => :disabled
    end
  end


  scope :displayed, -> { where(workflow_state: "enabled").order(places_count: :desc)}

end
