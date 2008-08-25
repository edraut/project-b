class Admin::ContentTemplatesController < Admin::ApplicationController
  # GET /content_templates
  # GET /content_templates.xml
  def index
    ContentTemplate.nil_names.each do |content_template|
      content_template.destroy
    end
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
    if params[:type]
      @content_template = params[:type].constantize.create
    else
      @content_template = ContentTemplate.create
    end
    
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
    push_to_db
  end

  # PUT /content_templates/1
  # PUT /content_templates/1.xml
  def update
    push_to_db
  end

  # DELETE /content_templates/1
  # DELETE /content_templates/1.xml
  def destroy
    @content_template = ContentTemplate.find(params[:id])
    @content_template.destroy

    respond_to do |format|
      format.html { redirect_to(admin_content_templates_url) }
      format.xml  { head :ok }
    end
  end

  private
  def push_to_db
    @content_template = ContentTemplate.find(params[:id])
    content_template_type_name = @content_template.class.name.underscore
    for id, content_template_params in params[content_template_type_name.to_sym]
      content_template = ContentTemplate.find(id.to_i)
      content_template.update_attributes(content_template_params)
      content_template.type = params[(content_template_type_name + '_type').to_sym][id]
      content_template.save
    end
    [:template_text, :template_image, :template_resource].each do |template_element_type|
      if params[template_element_type]
        element_params = params[template_element_type].dup
        for id, these_params in element_params
          template_element_type.to_s.classify.constantize.update(id, these_params)
        end
      end
    end

    if params[content_template_type_name.to_sym][params[:id]][:name].nil?
      @content_template.errors.add(:name,'cannot be blank.')
    end
    respond_to do |format|
      if  @content_template.errors.empty?
        flash[:notice] = 'ContentTemplate was successfully created.'
        format.html { redirect_to(edit_admin_content_template_path(@content_template)) }
        format.xml  { render :xml => @content_template, :status => :created, :location => @content_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_template.errors, :status => :unprocessable_entity }
      end
    end
  end
end
