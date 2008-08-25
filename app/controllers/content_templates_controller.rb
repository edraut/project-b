class ContentTemplatesController < ApplicationController
  # GET /content_templates
  # GET /content_templates.xml
  def index
    @content_templates = ContentTemplate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @content_templates }
    end
  end

  # GET /content_templates/1
  # GET /content_templates/1.xml
  def show
    @content_template = ContentTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content_template }
    end
  end

  # GET /content_templates/new
  # GET /content_templates/new.xml
  def new
    @content_template = ContentTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content_template }
    end
  end

  # GET /content_templates/1/edit
  def edit
    @content_template = ContentTemplate.find(params[:id])
  end

  # POST /content_templates
  # POST /content_templates.xml
  def create
    @content_template = ContentTemplate.new(params[:content_template])

    respond_to do |format|
      if @content_template.save
        flash[:notice] = 'ContentTemplate was successfully created.'
        format.html { redirect_to(@content_template) }
        format.xml  { render :xml => @content_template, :status => :created, :location => @content_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_templates/1
  # PUT /content_templates/1.xml
  def update
    @content_template = ContentTemplate.find(params[:id])

    respond_to do |format|
      if @content_template.update_attributes(params[:content_template])
        flash[:notice] = 'ContentTemplate was successfully updated.'
        format.html { redirect_to(@content_template) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /content_templates/1
  # DELETE /content_templates/1.xml
  def destroy
    @content_template = ContentTemplate.find(params[:id])
    @content_template.destroy

    respond_to do |format|
      format.html { redirect_to(content_templates_url) }
      format.xml  { head :ok }
    end
  end
end
