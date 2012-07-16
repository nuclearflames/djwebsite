class EventsController < ApplicationController
    
  def index
@events = Event.find(:all, :order => "event_date ASC", :limit => 8)
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def new
	@events = Event.new
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def edit
	@events = Event.find(params[:id])
  end

  def create
    @events = Event.new(params[:event])
	#@events.user_id = current_user.id
    respond_to do |format|
      if @events.save
        format.html { redirect_to @events, notice: 'Events was successfully created.' }
        format.json { render json: @events, status: :created, location: @events }
      else
        format.html { render :action => "new" }
        format.json { render json: @events.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @events = Event.find(params[:id])

    respond_to do |format|
      if @events.update_attributes(params[:event])
        format.html { redirect_to @events, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @events.errors, status: :unprocessable_entity }
      end
    end
end

  def destroy
      @events = Event.find(params[:id])
    @events.destroy

    respond_to do |format|
      format.html { redirect_to events_index_url }
      format.json { head :no_content }
    end
  end

  def show
	  @event = Event.find(params[:id])
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
end
