class SystemsController < ApplicationController
  
  # GET /systems/data.xml
  def tree
    @networks = Network.all
  end

  # GET /systems/data.xml
  def data
    network_id    = params[:id].split[0]
    site_id       = params[:id].split[1]
    subnet_id     = params[:id].split[2]
    
    if !subnet_id.nil? then
      @systems = Address.where(:subnet_id => subnet_id).collect { |i| i.interface.system }
    elsif !site_id.nil?
      @systems = Address.where(:subnet_id => Subnet.where(:site_id => site_id)).collect { |i| i.interface.system }
    elsif !network_id.to_i.zero?
      @systems = Address.where(:subnet_id => Subnet.where(:site_id => Site.where(:network_id => network_id))).collect { |i| i.interface.system }
    else
      @systems = System.all  
    end
  end

  # GET /systems/dbaction.xml
  def dbaction # supporting code for dhtmlx db/grid
    #called for all db actions
    system_name = params["c0"]
    location    = params["c1"]
    description = params["c3"]
    
    @mode = params["!nativeeditor_status"]
    
    @id = params["gr_id"]
    case @mode
        when "inserted"
            system = System.new
            system.system_name = system_name
            system.location    = location
            system.description = description
            system.save!
            
            @tid = system.id
        when "deleted"
            system=System.find(@id)
            system.destroy
            
            @tid = @id
        when "updated"
            system=System.find(@id)
            system.system_name = system_name
            system.location    = location
            system.description = description
            system.save!
            
            @tid = @id
    end 
  end

  # GET /systems
  # GET /systems.xml
  def index
    @systems = System.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @systems }
    end
  end

  # GET /systems/1
  # GET /systems/1.xml
  def show
    @system = System.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @system }
    end
  end

  # GET /systems/new
  # GET /systems/new.xml
  def new
    @system = System.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @system }
    end
  end

  # GET /systems/1/edit
  def edit
    @system = System.find(params[:id])
  end

  # POST /systems
  # POST /systems.xml
  def create
    @system = System.new(params[:system])

    respond_to do |format|
      if @system.save
        format.html { redirect_to(@system, :notice => 'System was successfully created.') }
        format.xml  { render :xml => @system, :status => :created, :location => @system }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @system.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /systems/1
  # PUT /systems/1.xml
  def update
    @system = System.find(params[:id])

    respond_to do |format|
      if @system.update_attributes(params[:system])
        format.html { redirect_to(@system, :notice => 'System was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @system.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /systems/1
  # DELETE /systems/1.xml
  def destroy
    @system = System.find(params[:id])
    @system.destroy

    respond_to do |format|
      format.html { redirect_to(systems_url) }
      format.xml  { head :ok }
    end
  end
end
