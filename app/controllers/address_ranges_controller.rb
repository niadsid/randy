class AddressRangesController < ApplicationController

  # GET /address_ranges/data.xml
  def tree
    @networks = Network.all
  end

  # GET /address_ranges/all_address_ranges.xml
  def all_address_ranges
        @address_ranges = AddressRange.all  
  end

  # GET /address_ranges/address_ranges_by_network.xml
  def address_ranges_by_network
    network_id    = params[:id].split[0]

    @address_ranges = AddressRange.where(:subnet_id => Subnet.where(:site_id => Site.where(:network_id => network_id)))
  end

  # GET /address_ranges/address_ranges_by_site.xml
  def address_ranges_by_site
    site_id       = params[:id].split[1]

    @address_ranges = AddressRange.where(:subnet_id => Subnet.where(:site_id => site_id))
  end

  # GET /address_ranges/address_ranges_by_subnet.xml
  def address_ranges_by_subnet
    subnet_id     = params[:id].split[2]
    
    @address_ranges = AddressRange.where(:subnet_id => subnet_id)
  end

  # GET /address_ranges/data.xml
  #def data
  #  network_id    = params[:id].split[0]
  #  site_id       = params[:id].split[1]
  #  subnet_id     = params[:id].split[2]
  #  
  #  if !subnet_id.nil? then
  #    @address_ranges = AddressRange.where(:subnet_id => subnet_id)
  #  elsif !site_id.nil?
  #    @address_ranges = AddressRange.where(:subnet_id => Subnet.where(:site_id => site_id))
  #  elsif !network_id.to_i.zero?
  #    @address_ranges = AddressRange.where(:subnet_id => Subnet.where(:site_id => Site.where(:network_id => network_id)))
  #  else
  #    @address_ranges = AddressRange.all  
  #  end
  #end

  # GET /address_ranges/dbaction.xml
  def dbaction # supporting code for dhtmlx db/grid
    #called for all db actions
    subnet_id       = params[:id].split[2]
    first_address   = params["c0"]
    last_address    = params["c1"]
    description     = params["c2"]
    
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            address_range=AddressRange.new
            address_range.subnet_id       = subnet_id
            address_range.first_address   = first_address
            address_range.last_address    = last_address
            address_range.description     = description
            address_range.save!
            
            @tid = address_range.id
        when "deleted"
            address_range=AddressRange.find(@id)
            address_range.destroy
            
            @tid = @id
        when "updated"
            address_range=AddressRange.find(@id)
            address_range.subnet_id     = subnet_id
            address_range.first_address = first_address
            address_range.last_address  = last_address
            address_range.description   = description
            address_range.save!
            
            @tid = @id
    end 
  end

  # GET /address_ranges/dbaction_sitenode.xml
  def dbaction_sitenode # supporting code for dhtmlx db/grid
    #called for all db actions
    subnet_id       = params[:id].split[2]
    first_address = params["c1"]
    last_address     = params["c2"]
    description     = params["c3"]
    
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            address_range=AddressRange.new
            address_range.first_address = first_address
            address_range.last_address     = last_address
            address_range.description     = description
            address_range.save!
            
            @tid = address_range.id
        when "deleted"
            address_range=AddressRange.find(@id)
            address_range.destroy
            
            @tid = @id
        when "updated"
            address_range=AddressRange.find(@id)
            address_range.first_address = first_address
            address_range.last_address     = last_address
            address_range.description     = description
            address_range.save!
            
            @tid = @id
    end 
  end

  # GET /address_ranges/dbaction_networknode.xml
  def dbaction_networknode # supporting code for dhtmlx db/grid
    #called for all db actions
    subnet_id       = params[:id].split[2]
    first_address = params["c2"]
    last_address     = params["c3"]
    description     = params["c4"]
    
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            address_range=AddressRange.new
            address_range.first_address = first_address
            address_range.last_address     = last_address
            address_range.description     = description
            address_range.save!
            
            @tid = address_range.id
        when "deleted"
            address_range=AddressRange.find(@id)
            address_range.destroy
            
            @tid = @id
        when "updated"
            address_range=AddressRange.find(@id)
            address_range.first_address = first_address
            address_range.last_address     = last_address
            address_range.description     = description
            address_range.save!
            
            @tid = @id
    end 
  end

  # GET /address_ranges/dbaction_alladdress_ranges.xml
  def dbaction_alladdress_ranges # supporting code for dhtmlx db/grid
    #called for all db actions
    first_address = params["c3"]
    last_address     = params["c4"]
    description     = params["c5"]
    
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            address_range=AddressRange.new
            address_range.first_address = first_address
            address_range.last_address     = last_address
            address_range.description     = description
            address_range.save!
            
            @tid = address_range.id
        when "deleted"
            address_range=AddressRange.find(@id)
            address_range.destroy
            
            @tid = @id
        when "updated"
            address_range=AddressRange.find(@id)
            address_range.first_address = first_address
            address_range.last_address     = last_address
            address_range.description     = description
            address_range.save!
            
            @tid = @id
    end 
  end

  # GET /address_ranges
  # GET /address_ranges.xml
  def index
    @address_ranges = AddressRange.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @address_ranges }
    end
  end

  # GET /address_ranges/1
  # GET /address_ranges/1.xml
  def show
    @address_range = AddressRange.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address_range }
    end
  end

  # GET /address_ranges/new
  # GET /address_ranges/new.xml
  def new
    @address_range = AddressRange.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address_range }
    end
  end

  # GET /address_ranges/1/edit
  def edit
    @address_range = AddressRange.find(params[:id])
  end

  # POST /address_ranges
  # POST /address_ranges.xml
  def create
    @address_range = AddressRange.new(params[:address_range])

    respond_to do |format|
      if @address_range.save
        format.html { redirect_to(@address_range, :notice => 'Address range was successfully created.') }
        format.xml  { render :xml => @address_range, :status => :created, :location => @address_range }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address_range.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /address_ranges/1
  # PUT /address_ranges/1.xml
  def update
    @address_range = AddressRange.find(params[:id])

    respond_to do |format|
      if @address_range.update_attributes(params[:address_range])
        format.html { redirect_to(@address_range, :notice => 'Address range was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address_range.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /address_ranges/1
  # DELETE /address_ranges/1.xml
  def destroy
    @address_range = AddressRange.find(params[:id])
    @address_range.destroy

    respond_to do |format|
      format.html { redirect_to(address_ranges_url) }
      format.xml  { head :ok }
    end
  end
end
