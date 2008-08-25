class PageResourcesController < ApplicationController
  # GET /page_resources
  # GET /page_resources.xml
  def index
    @page_resources = PageResource.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @page_resources }
    end
  end

  # GET /page_resources/1
  # GET /page_resources/1.xml
  def show
    @page_resource = PageResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page_resource }
    end
  end

  # GET /page_resources/new
  # GET /page_resources/new.xml
  def new
    @page_resource = PageResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page_resource }
    end
  end

  # GET /page_resources/1/edit
  def edit
    @page_resource = PageResource.find(params[:id])
  end

  # POST /page_resources
  # POST /page_resources.xml
  def create
    @page_resource = PageResource.new(params[:page_resource])

    respond_to do |format|
      if @page_resource.save
        flash[:notice] = 'PageResource was successfully created.'
        format.html { redirect_to(@page_resource) }
        format.xml  { render :xml => @page_resource, :status => :created, :location => @page_resource }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /page_resources/1
  # PUT /page_resources/1.xml
  def update
    @page_resource = PageResource.find(params[:id])

    respond_to do |format|
      if @page_resource.update_attributes(params[:page_resource])
        flash[:notice] = 'PageResource was successfully updated.'
        format.html { redirect_to(@page_resource) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /page_resources/1
  # DELETE /page_resources/1.xml
  def destroy
    @page_resource = PageResource.find(params[:id])
    @page_resource.destroy

    respond_to do |format|
      format.html { redirect_to(page_resources_url) }
      format.xml  { head :ok }
    end
  end
end
