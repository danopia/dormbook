class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  # GET /emails
  # GET /emails.xml
  def index
    #@emails = Email.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emails }
    end
  end

  # GET /emails/1
  # GET /emails/1.xml
  def show
    #@email = Email.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email }
    end
  end

  # GET /emails/new
  # GET /emails/new.xml
  def new
    #@email = Email.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email }
    end
  end

  # GET /emails/1/edit
  def edit
    #@email = Email.find(params[:id])
  end

  # POST /emails
  # POST /emails.xml
  def create
    @email = if params[:email]
      Email.new params[:email]
    else
      Email.new({
        :message => params[:message],
        :from => params[:from],
        :signature => params[:signature],
        :subject => params[:subject]})
    end
    
    @email.process! rescue nil
    @email.save

    render :text => (@email.processed ? 'success' : 'failure'), :status => 200    
    
    #respond_to do |format|
    #  if @email.processed
    #    format.html { redirect_to(@email, :notice => 'Email was successfully created.') }
    #    format.xml  { render :xml => @email, :status => :created, :location => @email }
    #  else
    #    format.html { render :action => "new" }
    #    format.xml  { render :xml => @email.errors, :status => :unprocessable_entity }
    #  end
    #end
  end

  # PUT /emails/1
  # PUT /emails/1.xml
  def update
    #@email = Email.find(params[:id])

    respond_to do |format|
      if @email.process!
        format.html { redirect_to(@email, :notice => 'Email was successfully processed.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.xml
  def destroy
    #@email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to(emails_url) }
      format.xml  { head :ok }
    end
  end
end
