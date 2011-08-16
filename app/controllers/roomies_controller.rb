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
    #@roomy = Roomie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @roomy }
    end
  end

  # GET /roomies/new
  # GET /roomies/new.xml
  def new
    @roomy = Roomie.new

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
	raw = params[:raw_string].split('-')

    @roomy = Roomie.new(params[:roomie])

@roomy.building = Building.find_by_number(raw[0][1..-1].to_i)
@roomy.room = raw[1]
@roomy.index = raw[2].to_i

me=Roomie.first(:conditions => {:building_id=>@roomy.building.id,
:room => raw[1],
:index => raw[2].to_i})

others=Roomie.all(:conditions => {:building_id=>@roomy.building.id,
:room => raw[1]})
others.delete me

if me && others.any?
	render :text => "Known roommates so far: #{others.map(&:name).join(', ')}. You are in #{@roomy.building.name}"
elsif me
	render :text => "Still no roommates yet, check back again later. You are in #{@roomy.building.name}"
elsif others.any?
	@roomy.save
	render :text => "Known roommates so far: #{others.map(&:name).join(', ')}. You are in #{@roomy.building.name}"
else
	@roomy.save
	render :text => "No roommates yet, check back later. You are in #{@roomy.building.name}"
end
  end

  # PUT /roomies/1
  # PUT /roomies/1.xml
  def update
    #@roomy = Roomie.find(params[:id])

    respond_to do |format|
      if @roomy.update_attributes(params[:roomy])
        format.html { redirect_to(@roomy, :notice => 'Roomie was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @roomy.errors, :status => :unprocessable_entity }
      end
    end
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
