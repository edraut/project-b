class PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.named(params[:name])

    respond_to do |format|
      if params[:partial]
        format.html { render :partial => @page.content_template.body_template_path, :object => @page}
      else
        format.html { render :template => @page.content_template.path, :object => @page}
      end
      format.xml  { render :xml => @page }
    end
  end

end
