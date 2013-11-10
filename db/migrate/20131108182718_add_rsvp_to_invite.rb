class AddRsvpToInvite < ActiveRecord::Migration
  def change
    add_column :invites, :rsvp, :boolean, default: false
  end
end
