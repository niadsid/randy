class AddressesController < ApplicationController

  # GET /addresses/data.xml
  def tree
    @networks = Network.all
  end

  # GET /addresses/all_addresses.xml
  def all_addresses
        @addresses = Address.all  
  end

  # GET /addresses/addresses_by_network.xml
  def addresses_by_network
    network_id    = params[:id].split[0]

    @addresses = Address.where(:subnet_id => Subnet.where(:site_id => Site.where(:network_id => network_id)))
  end

  # GET /addresses/addresses_by_site.xml
  def addresses_by_site
    site_id       = params[:id].split[1]

    @addresses = Address.where(:subnet_id => Subnet.where(:site_id => site_id))
  end

  # GET /addresses/addresses_by_subnet.xml
  def addresses_by_subnet
    subnet_id     = params[:id].split[2]
    
    @addresses = Address.where(:subnet_id => subnet_id)
  end

  # GET /addresses/data.xml
  #def data
  #  network_id    = params[:id].split[0]
  #  site_id       = params[:id].split[1]
  #  subnet_id     = params[:id].split[2]
  #  
  #  if !subnet_id.nil? then
  #    @addresses = Address.where(:subnet_id => subnet_id)
  #  elsif !site_id.nil?
  #    @addresses = Address.where(:subnet_id => Subnet.where(:site_id => site_id))
  #  elsif !network_id.to_i.zero?
  #    @addresses = Address.where(:subnet_id => Subnet.where(:site_id => Site.where(:network_id => network_id)))
  #  else
  #    @addresses = Address.all  
  #  end
  #end

  # GET /addresses/dbaction.xml
  def dbaction # supporting code for dhtmlx db/grid
    #called for all db actions
    subnet_id       = params[:id].split[2]
    network_address = params["c0"]
    mask_length     = params["c1"]
    description     = params["c2"]
    
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            address = Address.new
            address.subnet_id       = subnet_id
            address.network_address = network_address
            address.mask_length     = mask_length
            address.description     = description
            address.save!
            
            @tid = address.id
        when "deleted"
            address=Address.find(@id)
            address.destroy
            
            @tid = @id
        when "updated"
            address=Address.find(@id)
            address.subnet_id       = subnet_id
            address.network_address = network_address
            address.mask_length     = mask_length
            address.description     = description
            address.save!
            
            @tid = @id
    end 
  end

  # GET /addresses/dbaction_sitenode.xml
  def dbaction_sitenode # supporting code for dhtmlx db/grid
    #called for all db actions
    subnet_id       = params[:id].split[2]
    network_address = params["c1"]
    mask_length     = params["c2"]
    description     = params["c3"]
    
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            address = Address.new
            address.network_address = network_address
            address.mask_length     = mask_length
            address.description     = description
            address.save!
            
            @tid = address.id
        when "deleted"
            address=Address.find(@id)
            address.destroy
            
            @tid = @id
        when "updated"
            address=Address.find(@id)
            address.network_address = network_address
            address.mask_length     = mask_length
            address.description     = description
            address.save!
            
            @tid = @id
    end 
  end

  # GET /addresses/dbaction_networknode.xml
  def dbaction_networknode # supporting code for dhtmlx db/grid
    #called for all db actions
    subnet_id       = params[:id].split[2]
    network_address = params["c2"]
    mask_length     = params["c3"]
    description     = params["c4"]
    
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            address = Address.new
            address.network_address = network_address
            address.mask_length     = mask_length
            address.description     = description
            address.save!
            
            @tid = address.id
        when "deleted"
            address=Address.find(@id)
            address.destroy
            
            @tid = @id
        when "updated"
            address=Address.find(@id)
            address.network_address = network_address
            address.mask_length     = mask_length
            address.description     = description
            address.save!
            
            @tid = @id
    end 
  end

  # GET /addresses/dbaction_alladdresses.xml
  def dbaction_alladdresses # supporting code for dhtmlx db/grid
    #called for all db actions
    network_address = params["c3"]
    mask_length     = params["c4"]
    description     = params["c5"]
    
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            address = Address.new
            address.network_address = network_address
            address.mask_length     = mask_length
            address.description     = description
            address.save!
            
            @tid = address.id
        when "deleted"
            address=Address.find(@id)
            address.destroy
            
            @tid = @id
        when "updated"
            address=Address.find(@id)
            address.network_address = network_address
            address.mask_length     = mask_length
            address.description     = description
            address.save!
            
            @tid = @id
    end 
  end

  # GET /addresses
  # GET /addresses.xml
  def index
    @addresses = Address.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addresses }
    end
  end

  # GET /addresses/1
  # GET /addresses/1.xml
  def show
    @address = Address.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/new
  # GET /addresses/new.xml
  def new
    @address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.xml
  def create
    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
        format.html { redirect_to(@address, :notice => 'Address was successfully created.') }
        format.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to(@address, :notice => 'Address was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to(addresses_url) }
      format.xml  { head :ok }
    end
  end
end
