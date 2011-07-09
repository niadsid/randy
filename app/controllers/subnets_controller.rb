class SubnetsController < ApplicationController

  def tree
    @networks = Network.all
  end
 
  # GET /subnets/all_subnets.xml
  def all_subnets
    @subnets = Subnet.all
  end
 
  # GET /subnets/subnets_by_network.xml
  def subnets_by_network
    network_id    = params[:id].split[0]
    
    @subnets = Subnet.where(:site_id => Site.where(:network_id => network_id))
  end
 
  # GET /subnets/subnets_by_site.xml
  def subnets_by_site
    site_id       = params[:id].split[1]
    
    @subnets = Subnet.where(:site_id => site_id)
  end
  
  # GET /subnets/dbaction.xml
  def dbaction # supporting code for dhtmlx db/grid
    #called for all db actions
    site_id           = params[:id].split[1]
    subnet_name       = params["c0"]
    subnet_identifier = params["c1"]
    mask_length       = params["c2"]
    default_router    = params["c3"]
    description       = params["c4"]
 
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            subnet = Subnet.new
            subnet.site_id            = site_id
            subnet.subnet_name        = subnet_name
            subnet.subnet_identifier  = subnet_identifier
            subnet.mask_length        = mask_length
            subnet.default_router     = default_router
            subnet.description        = description
            subnet.save!
            
            @tid = subnet.id
        when "deleted"
            subnet=Subnet.find(@id)
            subnet.destroy
            
            @tid = @id
        when "updated"
            subnet=Subnet.find(@id)
            subnet.site_id            = site_id
            subnet.subnet_name        = subnet_name
            subnet.subnet_identifier  = subnet_identifier
            subnet.mask_length        = mask_length
            subnet.default_router     = default_router
            subnet.description        = description
            subnet.save!
            
            @tid = @id
    end 
  end

  # GET /subnets/dbaction_networknode.xml
  def dbaction_networknode # supporting code for dhtmlx db/grid
    #called for all db actions
    site_id           = params[:id].split[1]
    subnet_name       = params["c1"]
    subnet_identifier = params["c2"]
    mask_length       = params["c3"]
    default_router    = params["c4"]
    description       = params["c5"]
 
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            subnet = Subnet.new
            subnet.subnet_name        = subnet_name
            subnet.subnet_identifier  = subnet_identifier
            subnet.mask_length        = mask_length
            subnet.default_router     = default_router
            subnet.description        = description
            subnet.save!
            
            @tid = subnet.id
        when "deleted"
            subnet=Subnet.find(@id)
            subnet.destroy
            
            @tid = @id
        when "updated"
            subnet=Subnet.find(@id)
            subnet.subnet_name        = subnet_name
            subnet.subnet_identifier  = subnet_identifier
            subnet.mask_length        = mask_length
            subnet.default_router     = default_router
            subnet.description        = description
            subnet.save!
            
            @tid = @id
    end 
  end
  
  # GET /subnets/dbaction_networknode.xml
  def dbaction_allsubnets # supporting code for dhtmlx db/grid
    #called for all db actions
    subnet_name       = params["c2"]
    subnet_identifier = params["c3"]
    mask_length       = params["c4"]
    default_router    = params["c5"]
    description       = params["c6"]
 
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            subnet = Subnet.new
            subnet.subnet_name        = subnet_name
            subnet.subnet_identifier  = subnet_identifier
            subnet.mask_length        = mask_length
            subnet.default_router     = default_router
            subnet.description        = description
            subnet.save!
            
            @tid = subnet.id
        when "deleted"
            subnet=Subnet.find(@id)
            subnet.destroy
            
            @tid = @id
        when "updated"
            subnet=Subnet.find(@id)
            subnet.subnet_name        = subnet_name
            subnet.subnet_identifier  = subnet_identifier
            subnet.mask_length        = mask_length
            subnet.default_router     = default_router
            subnet.description        = description
            subnet.save!
            
            @tid = @id
    end 
  end

  # GET /subnets
  # GET /subnets.xml
  def index
    @subnets = Subnet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subnets }
    end
  end

  # GET /subnets/1
  # GET /subnets/1.xml
  def show
    @subnet = Subnet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subnet }
    end
  end

  # GET /subnets/new
  # GET /subnets/new.xml
  def new
    @subnet = Subnet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subnet }
    end
  end

  # GET /subnets/1/edit
  def edit
    @subnet = Subnet.find(params[:id])
  end

  # POST /subnets
  # POST /subnets.xml
  def create
    @subnet = Subnet.new(params[:subnet])

    respond_to do |format|
      if @subnet.save
        format.html { redirect_to(@subnet, :notice => 'Subnet was successfully created.') }
        format.xml  { render :xml => @subnet, :status => :created, :location => @subnet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subnet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subnets/1
  # PUT /subnets/1.xml
  def update
    @subnet = Subnet.find(params[:id])

    respond_to do |format|
      if @subnet.update_attributes(params[:subnet])
        format.html { redirect_to(@subnet, :notice => 'Subnet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subnet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subnets/1
  # DELETE /subnets/1.xml
  def destroy
    @subnet = Subnet.find(params[:id])
    @subnet.destroy

    respond_to do |format|
      format.html { redirect_to(subnets_url) }
      format.xml  { head :ok }
    end
  end
end
