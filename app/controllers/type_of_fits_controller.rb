class TypeOfFitsController < ApplicationController
  # GET /type_of_fits
  # GET /type_of_fits.xml
  def index
    @type_of_fits = TypeOfFit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @type_of_fits }
    end
  end

  # GET /type_of_fits/1
  # GET /type_of_fits/1.xml
  def show
    @type_of_fit = TypeOfFit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @type_of_fit }
    end
  end

  # GET /type_of_fits/new
  # GET /type_of_fits/new.xml
  def new
    @type_of_fit = TypeOfFit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @type_of_fit }
    end
  end

  # GET /type_of_fits/1/edit
  def edit
    @type_of_fit = TypeOfFit.find(params[:id])
  end

  # POST /type_of_fits
  # POST /type_of_fits.xml
  def create
    @type_of_fit = TypeOfFit.new(params[:type_of_fit])

    respond_to do |format|
      if @type_of_fit.save
        format.html { redirect_to(@type_of_fit, :notice => 'Type of fit was successfully created.') }
        format.xml  { render :xml => @type_of_fit, :status => :created, :location => @type_of_fit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @type_of_fit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /type_of_fits/1
  # PUT /type_of_fits/1.xml
  def update
    @type_of_fit = TypeOfFit.find(params[:id])

    respond_to do |format|
      if @type_of_fit.update_attributes(params[:type_of_fit])
        format.html { redirect_to(@type_of_fit, :notice => 'Type of fit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @type_of_fit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_fits/1
  # DELETE /type_of_fits/1.xml
  def destroy
    @type_of_fit = TypeOfFit.find(params[:id])
    @type_of_fit.destroy

    respond_to do |format|
      format.html { redirect_to(type_of_fits_url) }
      format.xml  { head :ok }
    end
  end
end
