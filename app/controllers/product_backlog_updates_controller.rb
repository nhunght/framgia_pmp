class ProductBacklogUpdatesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    @mode = params["!nativeeditor_status"]
    category, story, priority, estimate, actual, remaining, project_id = params[:c0],
      params[:c1], params[:c2], params[:c3], params[:c4], params[:c5], params[:project_id]

    @id = params["gr_id"]

    case @mode
    when "deleted"
        ProductBacklog.find(@id).destroy
        @tid = @id

    when "updated"
      if @id.empty?
        product_backlog = ProductBacklog.create category: category, story: story,
          priority: priority, estimate: estimate, actual: actual,remaining: remaining,
          project_id: project_id
      else
        product_backlog = ProductBacklog.find @id
        product_backlog.update_attributes category: category, story: story,
          priority: priority, estimate: estimate, actual: actual, remaining: remaining,
          project_id: project_id
        product_backlog.save
        @tid = @id
      end
    end    
  end
end
