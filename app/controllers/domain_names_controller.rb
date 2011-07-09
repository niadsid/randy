class DomainNamesController < ApplicationController
    
  # GET /networks/data.xml
  def data
    @domain_names = DomainName.all
  end
  
  # GET /domain_names
  # GET /domain_names.xml
  def index
    @domain_names = DomainName.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @domain_names }
    end
  end

  # GET /domain_names/1
  # GET /domain_names/1.xml
  def show
    @domain_name = DomainName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @domain_name }
    end
  end

  # GET /domain_names/new
  # GET /domain_names/new.xml
  def new
    @domain_name = DomainName.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @domain_name }
    end
  end

  # GET /domain_names/1/edit
  def edit
    @domain_name = DomainName.find(params[:id])
  end

  # POST /domain_names
  # POST /domain_names.xml
  def create
    @domain_name = DomainName.new(params[:domain_name])

    respond_to do |format|
      if @domain_name.save
        format.html { redirect_to(@domain_name, :notice => 'Domain name was successfully created.') }
        format.xml  { render :xml => @domain_name, :status => :created, :location => @domain_name }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @domain_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /domain_names/1
  # PUT /domain_names/1.xml
  def update
    @domain_name = DomainName.find(params[:id])

    respond_to do |format|
      if @domain_name.update_attributes(params[:domain_name])
        format.html { redirect_to(@domain_name, :notice => 'Domain name was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @domain_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /domain_names/1
  # DELETE /domain_names/1.xml
  def destroy
    @domain_name = DomainName.find(params[:id])
    @domain_name.destroy

    respond_to do |format|
      format.html { redirect_to(domain_names_url) }
      format.xml  { head :ok }
    end
  end
end
