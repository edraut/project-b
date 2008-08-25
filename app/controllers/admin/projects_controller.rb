class Admin::ProjectsController < Admin::ApplicationController
  # GET /projects
  # GET /projects.xml
  def index
    Project.nil_names.each do |project|
      project.destroy
    end
    @projects = Project.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.create

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    push_to_db
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    push_to_db
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(admin_projects_url) }
      format.xml  { head :ok }
    end
  end

  private
  
  def push_to_db
    @project = Project.find(params[:id])

    @project.update_attributes(params[:project][params[:id]])
    for id, article_image_params in params[:article_image]
      article_image = ArticleImage.find(id)
      article_image.update_attributes(article_image_params)
    end if params[:article_image]
    if params[:project][params[:id]][:name].nil?
      @project.errors.add(:name, 'cannot be blank')
    end
    
    respond_to do |format|
      if @project.errors.empty?
        flash[:notice] = 'Project was successfully saved.'
        format.html { redirect_to(edit_admin_project_path(@project)) }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

end
