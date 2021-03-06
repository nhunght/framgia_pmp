class WorkPerformancesController < ApplicationController
  load_resource
  load_resource :project
  load_resource :sprint

  def index
    @sprints = Sprint.list_by_user current_user
    @phases = Phase.all
    @activities = @sprint.activities
  end

  def update
    respond_to do |format|
      if @work_performance.update performance_data_params
        format.json {head :no_content}
        format.js
      else
        format.json {render json: @customer.errors.full_messages,
          status: :unprocessable_entity}
      end
    end
  end

  private
  def performance_data_params
    params.require(:work_performance).permit WorkPerformance::ATTRIBUTES_PARAMS
  end
end
