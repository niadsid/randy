class SitesController < ApplicationController

  def tree
    @networks = Network.all
  end
  
  # GET /sites/all_sites.xml
  def all_sites
      @sites = Site.all
  end

  # GET /sites/sites_by_network.xml
  def sites_by_network
    network_id    = params[:id].split[0]
    
    @sites = Site.where(:network_id => network_id)
  end
  
  # GET /sites/dbaction.xml
  def dbaction # supporting code for dhtmlx db/grid
    #called for all db actions
    network_id      = params[:id]
    site_name       = params["c0"]
    description     = params["c1"]
  
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            site              = Site.new
            site.site_name    = site_name
            site.network_id   = network_id
            site.description  = description
            site.save!
            
            @tid = site.id
        when "deleted"
            site=Site.find(@id)
            site.destroy
            
            @tid = @id
        when "updated"
            site=Site.find(@id)
            site.site_name    = site_name
            site.network_id   = network_id
            site.description  = description
            site.save!
            
            @tid = @id
    end 
  end
  
  # GET /sites/dbaction_allsites.xml
  def dbaction_allsites # supporting code for dhtmlx db/grid
    #called for all db actions
    site_name       = params["c1"]
    description     = params["c2"]
  
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            site              = Site.new
            site.site_name    = site_name
            site.description  = description
            site.save!
            
            @tid = site.id
        when "deleted"
            site=Site.find(@id)
            site.destroy
            
            @tid = @id
        when "updated"
            site=Site.find(@id)
            site.site_name    = site_name
            site.description  = description
            site.save!
            
            @tid = @id
    end 
  end
  
  # GET /sites
  # GET /sites.xml
  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        format.html { redirect_to(@site, :notice => 'Site was successfully created.') }
        format.xml  { render :xml => @site, :status => :created, :location => @site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.xml
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to(@site, :notice => 'Site was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.xml
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to(sites_url) }
      format.xml  { head :ok }
    end
  end
end
