class ProductsController < ApplicationController
  # handle all product URLs here first, and route over to other actions after parsing
  $filters = Hash.new

  def products_router
    # first, create a hash that captures the filter parameters specified on the URL
    filterParams = params["other"].split(/\//)
    numParams = filterParams.length
    #    logger.info(filterParams)
    showListings = "true"

    # if numParams == 0, this route will not be called, so we can assume there is at least one filterParam
    # need to check to see if there are any matches across Groupings, Categories, Size, Style, Price Range
    i = 0
    loop {
      param = filterParams[i]
      i += 1
      if (i == 1) then
        if Grouping.find_by_urlname(param) then
          $filters[:grouping] = Grouping.find_by_urlname(param)
        elsif Category.find_by_urlname(param)
          $filters[:primaryCategory_id] = Category.find_by_urlname(param)
        elsif Size.find_by_urlname(param)
          $filters[:size_id] = Size.find_by_urlname(param)
        elsif Style.find_by_urlname(param)
          $filters[:style_id] = Style.find_by_urlname(param)
        else
          prices = param.split(/-/)
          if (prices[0] == "dollars")
            $filters[:price] = prices[1]..prices[2]
          elsif (param == "all")
            # do nothing
          else
            showListings = "false"
          end
        end
      elsif (i == 2) then
        if Category.find_by_urlname(param)
          $filters[:primaryCategory_id] = Category.find_by_urlname(param)
        elsif Size.find_by_urlname(param)
          $filters[:size_id] = Size.find_by_urlname(param)
        elsif Style.find_by_urlname(param)
          $filters[:style_id] = Style.find_by_urlname(param)
        else
          prices = param.split(/-/)
          if (prices[0] == "dollars")
            $filters[:price] = prices[1]..prices[2]
          elsif (param == "all")
            # do nothing
          else
            showListings = "false"
          end
        end
      elsif (i == 3) then
        if Size.find_by_urlname(param)
          $filters[:size_id] = Size.find_by_urlname(param)
        elsif Style.find_by_urlname(param)
          $filters[:style_id] = Style.find_by_urlname(param)
        else
          prices = param.split(/-/)
          if (prices[0] == "dollars")
            $filters[:price] = prices[1]..prices[2]
          elsif (param == "all")
            # do nothing
          else
            showListings = "false"
          end
        end
      elsif (i == 4) then
        if Style.find_by_urlname(param)
          $filters[:style_id] = Style.find_by_urlname(param)
        else
          prices = param.split(/-/)
          if (prices[0] == "dollars")
            $filters[:price] = prices[1]..prices[2]
          elsif (param == "all")
            # do nothing
          else
            showListings = "false"
          end
        end
      elsif (i == 5) then
        prices = param.split(/-/)
        if (prices[0] == "dollars")
            $filters[:price] = prices[1]..prices[2]
          elsif (param == "all")
            # do nothing
        else
          showListings = "false"
        end
      end

      break if (i >= numParams)
    }
    $filters.each { |k,v| logger.info("#{k} => #{v}") }

    if (showListings == "true")
      # create filter hash to hold filtering parameters to pass into search query
      # can filter on: attributes, category, size, price, style
      # (and maybe color)
      #
      #      filter[:style_id] = Style.find_by_name(filters[0])
      #      price = filterParams[1].split(/-/)
      #
      #      filter[:size] = filterParams[0]
      #
      #
      #      if params[:size] then filter[:size] = params[:size] end
      #      if params[:primaryCategory_id] then filter[:primaryCategory_id] = params[:primaryCategory_id] end
      #      if params[:style_id] then filter[:style_id] = params[:style_id] end
      @products = Product.paginate :page => params[:page], :order => 'created_at DESC',
        :conditions => $filters

      respond_to do |format|
        format.html { render :index }
        format.xml  { render :xml => @products }
      end
    else
      @product = Product.find(params[:id])

      respond_to do |format|
        format.html { render :show }
        format.xml  { render :xml => @product }
      end
    end

  end

  # GET /products
  # GET /products.xml
  def index
    @products = Product.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
    2.times {@product.photos.build} # added this
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    2.times { @product.photos.build } # ... and this
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    @product.primaryCategory_id = params[:product][:category_ids]
    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
end
