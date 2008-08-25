class Admin::TextElementsController < Admin::ApplicationController
  # GET /text_elements
  # GET /text_elements.xml
  def index
    @text_elements = TextElement.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @text_elements }
    end
  end

  # GET /text_elements/1
  # GET /text_elements/1.xml
  def show
    @text_element = TextElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @text_element }
    end
  end

  # GET /text_elements/new
  # GET /text_elements/new.xml
  def new
    @text_element = TextElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @text_element }
    end
  end

  # GET /text_elements/1/edit
  def edit
    @text_element = TextElement.find(params[:id])
  end

  # POST /text_elements
  # POST /text_elements.xml
  def create
    @text_element = TextElement.new(params[:text_element])

    respond_to do |format|
      if @text_element.save
        flash[:notice] = 'TextElement was successfully created.'
        format.html { redirect_to([:admin,@text_element]) }
        format.xml  { render :xml => @text_element, :status => :created, :location => @text_element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @text_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /text_elements/1
  # PUT /text_elements/1.xml
  def update
    @text_element = TextElement.find(params[:id])

    respond_to do |format|
      if @text_element.update_attributes(params[:text_element])
        flash[:notice] = 'TextElement was successfully updated.'
        format.html { redirect_to([:admin,@text_element]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @text_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /text_elements/1
  # DELETE /text_elements/1.xml
  def destroy
    @text_element = TextElement.find(params[:id])
    @text_element.destroy

    respond_to do |format|
      format.html { redirect_to(admin_text_elements_url) }
      format.xml  { head :ok }
    end
  end
end
