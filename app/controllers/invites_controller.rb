class InvitesController < ApplicationController
  before_action :set_invite, only: [:edit, :show, :update]
  def new
    @invite = Invite.new(event_id: params[:event_id])
    @users = User.all
  end

  def edit
    @user = User.find_by(id: @invite.user_id)
  end

  def show
  end

  def create
    @event = Event.find(params[:invite][:event_id])

    # if user was already invited to this event
    if Invite.where(user_id: params[:invite][:user_id], event_id: params[:invite][:event_id]).exists? 
      respond_to do |format|
        format.html {redirect_to new_event_invite_path(@event), notice: 'This user was already invited.'}
      end
    else 
      @invite = Invite.new(invite_params)
      respond_to do |format|
        if @invite.save
          format.html { redirect_to @invite, notice: 'Invite was successfully created.' }
          format.json { render action: 'show', status: :created, location: @invite }
        else
          format.html { render action: 'new' }
          format.json { render json: @invite.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Always run this line before above actions
  def set_invite
    @invite = Invite.find_by(id: params[:id])
  end

  def invite_params
    params.require(:invite).permit(:user_id, :event_id, :rsvp)
  end
end
