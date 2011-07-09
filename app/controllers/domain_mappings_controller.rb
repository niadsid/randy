class DomainMappingsController < ApplicationController
  # GET /domain_mappings
  # GET /domain_mappings.xml
  def index
    @domain_mappings = DomainMapping.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @domain_mappings }
    end
  end

  # GET /domain_mappings/1
  # GET /domain_mappings/1.xml
  def show
    @domain_mapping = DomainMapping.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @domain_mapping }
    end
  end

  # GET /domain_mappings/new
  # GET /domain_mappings/new.xml
  def new
    @domain_mapping = DomainMapping.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @domain_mapping }
    end
  end

  # GET /domain_mappings/1/edit
  def edit
    @domain_mapping = DomainMapping.find(params[:id])
  end

  # POST /domain_mappings
  # POST /domain_mappings.xml
  def create
    @domain_mapping = DomainMapping.new(params[:domain_mapping])

    respond_to do |format|
      if @domain_mapping.save
        format.html { redirect_to(@domain_mapping, :notice => 'Domain mapping was successfully created.') }
        format.xml  { render :xml => @domain_mapping, :status => :created, :location => @domain_mapping }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @domain_mapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /domain_mappings/1
  # PUT /domain_mappings/1.xml
  def update
    @domain_mapping = DomainMapping.find(params[:id])

    respond_to do |format|
      if @domain_mapping.update_attributes(params[:domain_mapping])
        format.html { redirect_to(@domain_mapping, :notice => 'Domain mapping was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @domain_mapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /domain_mappings/1
  # DELETE /domain_mappings/1.xml
  def destroy
    @domain_mapping = DomainMapping.find(params[:id])
    @domain_mapping.destroy

    respond_to do |format|
      format.html { redirect_to(domain_mappings_url) }
      format.xml  { head :ok }
    end
  end
end
