class ExamplesController < ApplicationController
  def index
    @location = params[:location] if params[:location]
    @location ||= 'New York'
    @category = params[:category] if params[:category]
    @category ||= 'All Categories'
    @category_two = params[:category_two] if params[:category_two]
    @category_two ||= nil
    @price_range = params[:price_range] if params[:price_range]
    @price_range ||= 'All'
    @search_term = params[:search_term] if params[:search_term]
    @search_term ||= ''
  end
  
end