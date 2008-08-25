class Admin::TemplateElementsController < Admin::ApplicationController
  # GET /template_elements
  # GET /template_elements.xml
  def index
    @template_elements = TemplateElement.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @template_elements }
    end
  end

  # GET /template_elements/1
  # GET /template_elements/1.xml
  def show
    @template_element = TemplateElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @template_element }
    end
  end

  # GET /template_elements/new
  # GET /template_elements/new.xml
  def new
    if params[:type]
      @template_element = params[:type].classify.constantize.create(:content_template_id => params[:parent_id])
      if params[:type] == 'template_dependent_partial'
        @dependent_partial_template = DependentPartialTemplate.create
        @template_element.partial_template = @dependent_partial_template
        @template_element.save
      end
    end
    
    respond_to do |format|
      format.html { render :partial => 'li', :object => @template_element }
      format.xml  { render :xml => @template_element }
    end
  end

  # GET /template_elements/1/edit
  def edit
    @template_element = TemplateElement.find(params[:id])
  end

  # POST /template_elements
  # POST /template_elements.xml
  def create
    @template_element = TemplateElement.new(params[:template_element])

    respond_to do |format|
      if @template_element.save
        flash[:notice] = 'TemplateElement was successfully created.'
        format.html { redirect_to([:admin,@template_element]) }
        format.xml  { render :xml => @template_element, :status => :created, :location => @template_element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @template_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /template_elements/1
  # PUT /template_elements/1.xml
  def update
    @template_element = TemplateElement.find(params[:id])

    respond_to do |format|
      if @template_element.update_attributes(params[:template_element])
        flash[:notice] = 'TemplateElement was successfully updated.'
        format.html { redirect_to([:admin,@template_element]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @template_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /template_elements/1
  # DELETE /template_elements/1.xml
  def destroy
    @template_element = TemplateElement.find(params[:id])
    @template_element.destroy

    respond_to do |format|
      format.html { render :nothing => true }
      format.xml  { head :ok }
    end
  end
end
