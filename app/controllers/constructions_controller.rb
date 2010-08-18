class ConstructionsController < ApplicationController
  # GET /constructions
  # GET /constructions.xml
  def index
    @constructions = Construction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @constructions }
    end
  end

  # GET /constructions/1
  # GET /constructions/1.xml
  def show
    @construction = Construction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @construction }
    end
  end

  # GET /constructions/new
  # GET /constructions/new.xml
  def new
    @construction = Construction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @construction }
    end
  end

  # GET /constructions/1/edit
  def edit
    @construction = Construction.find(params[:id])
  end

  # POST /constructions
  # POST /constructions.xml
  def create
    @construction = Construction.new(params[:construction])

    respond_to do |format|
      if @construction.save
        format.html { redirect_to(@construction, :notice => 'Construction was successfully created.') }
        format.xml  { render :xml => @construction, :status => :created, :location => @construction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @construction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /constructions/1
  # PUT /constructions/1.xml
  def update
    @construction = Construction.find(params[:id])

    respond_to do |format|
      if @construction.update_attributes(params[:construction])
        format.html { redirect_to(@construction, :notice => 'Construction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @construction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /constructions/1
  # DELETE /constructions/1.xml
  def destroy
    @construction = Construction.find(params[:id])
    @construction.destroy

    respond_to do |format|
      format.html { redirect_to(constructions_url) }
      format.xml  { head :ok }
    end
  end
end
