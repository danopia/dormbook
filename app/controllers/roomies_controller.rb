class RoomiesController < ApplicationController
  # GET /roomies
  # GET /roomies.xml
  def index
    #@roomies = Roomie.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roomies }
    end
  end

  # GET /roomies/1
  # GET /roomies/1.xml
  def show
    @roomy = Roomie.find params[:id]
    
    @others = Roomie.all(:conditions => {
      :building_id => @roomy.building.id,
      :room => @roomy.room})
    @others = @others.select {|i| i.id != @roomy.id }

    @bldg = Roomie.all(:conditions => {:building_id => @roomy.building.id})
    @bldg = @bldg.select {|i| i.id != @roomy.id }

    @floors = @bldg.select{|o| o.floor == @roomy.floor }

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @roomy }
    end
  end

  # GET /roomies/new
  # GET /roomies/new.xml
  def new
    return redirect_to(@roomie) if @roomie
    @roomy = Roomie.new(@has_facebook ? fb_roomie_info : {})

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @roomy }
    end
  end

  # GET /roomies/1/edit
  def edit
    #@roomy = Roomie.find(params[:id])
  end

  # POST /roomies
  # POST /roomies.xml
  def create
    @roomy = Roomie.new(params[:roomie])

    @roomy = Roomie.first(:conditions => {
      :building_id => @roomy.building_id,
      :room => @roomy.room,
      :index => @roomy.index}) || @roomy

    respond_to do |format|
      if !@roomy.save
        format.html { render :action => "new" }
        format.xml  { render :xml => @roomy.errors, :status => :unprocessable_entity }
      elsif @roomy.created_at > (Time.now - 10.seconds)
        format.html { redirect_to(@roomy, :notice => 'Room assignment was successfully added.') }
        format.xml  { render :xml => @roomy, :status => :created, :location => @roomy }
      else
        format.html { redirect_to(@roomy) }
        format.xml  { render :xml => @roomy, :status => :updated, :location => @roomy }
      end
    end
    
    @roomy.update_attributes fb_roomie_info if @has_facebook
  end

  # PUT /roomies/1
  # PUT /roomies/1.xml
  def update
    #@roomy = Roomie.find(params[:id])

    #respond_to do |format|
    #  if @roomy.update_attributes(params[:roomy])
    #    format.html { redirect_to(@roomy, :notice => 'Roomie was successfully updated.') }
    #    format.xml  { head :ok }
    #  else
    #    format.html { render :action => "edit" }
    #    format.xml  { render :xml => @roomy.errors, :status => :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /roomies/1
  # DELETE /roomies/1.xml
  def destroy
    #@roomy = Roomie.find(params[:id])
    @roomy.destroy

    respond_to do |format|
      format.html { redirect_to(roomies_url) }
      format.xml  { head :ok }
    end
  end
end
