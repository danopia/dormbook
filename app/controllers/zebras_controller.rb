class ZebrasController < ApplicationController
  # GET /zebras
  # GET /zebras.xml
  def index
    @zebras = Zebra.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @zebras }
    end
  end

  # GET /zebras/1
  # GET /zebras/1.xml
  def show
    @zebra = Zebra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @zebra }
    end
  end

  # GET /zebras/new
  # GET /zebras/new.xml
  def new
    @zebra = Zebra.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @zebra }
    end
  end

  # GET /zebras/1/edit
  def edit
    @zebra = Zebra.find(params[:id])
  end

  # POST /zebras
  # POST /zebras.xml
  def create
    @zebra = Zebra.new(params[:zebra])

    respond_to do |format|
      if @zebra.save
        format.html { redirect_to(@zebra, :notice => 'Zebra was successfully created.') }
        format.xml  { render :xml => @zebra, :status => :created, :location => @zebra }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @zebra.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /zebras/1
  # PUT /zebras/1.xml
  def update
    @zebra = Zebra.find(params[:id])

    respond_to do |format|
      if @zebra.update_attributes(params[:zebra])
        format.html { redirect_to(@zebra, :notice => 'Zebra was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @zebra.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /zebras/1
  # DELETE /zebras/1.xml
  def destroy
    @zebra = Zebra.find(params[:id])
    @zebra.destroy

    respond_to do |format|
      format.html { redirect_to(zebras_url) }
      format.xml  { head :ok }
    end
  end
end
