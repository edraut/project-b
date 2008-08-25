class Admin::PagesController < Admin::ApplicationController
  # GET /pages
  # GET /pages.xml
  def index
    Page.nil_names.each do |page|
      page.destroy
    end
    @pages = Page.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.create

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    push_to_db
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    push_to_db
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(admin_pages_url) }
      format.xml  { head :ok }
    end
  end
  
  private

  def push_to_db
    @page = Page.find(params[:id])
    if params[:content_template_id]
      if params[:content_template_id].to_i != 0
        content_template = ContentTemplate.find(params[:content_template_id].to_i)
        @page.text_elements.clear
        @page.image_elements.clear
        @page.page_resources.clear
        @page.content_template = content_template
        @page.type = content_template.page_class_name
        # image_elements = []
        for template_element in content_template.template_elements
          case template_element.class.name
          when 'TemplateText'
            TextElement.create(:page_id => @page.id, :name => template_element.name)
          when 'TemplateImage'
            image_element = ImageElement.new(:attachable_id => @page.id, :attachable_type => 'Page', :name => template_element.name)
            image_element.save(false)
          when 'TemplateResource'
            PageResource.create(:page_id => @page.id, :resource_type => template_element.resource_type, :name => template_element.name) 
          end
        end
        @page.save
        @page.reload
        # @page.image_elements = image_elements if image_elements.length > 0
        respond_to do |format|
          format.html { render :partial => 'instantiate_elements', :object => @page }
          format.xml  { render :xml => @page }
        end
      else
        render :nothing => true
      end
    else
      for element_id, element_params in params[:text_element]
        text_element = TextElement.find(element_id)
        text_element.update_attributes(element_params)
      end if params[:text_element]
      case params[:image_element].class.name
      when 'Array'
        for element_params in params[:image_element]
          image_element = ImageElement.new(element_params)
          image_element.save
        end
      when 'Hash', 'HashWithIndifferentAccess'
        for element_id, element_params in params[:image_element]
          image_element = ImageElement.find(element_id)
          image_element.update_attributes(element_params) if element_params.has_key?(:uploaded_data) and element_params[:uploaded_data].length > 0
        end
      end if params[:image_element]
      for element_id, element_params in params[:page_resource]
        page_resource = PageResource.find(element_id)
        page_resource.update_attributes(element_params)
      end if params[:page_resource]

      respond_to do |format|
        if @page.update_attributes(params[:page])
          flash[:notice] = 'Page was successfully updated.'
          format.html { redirect_to(edit_admin_page_path(@page)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
end
