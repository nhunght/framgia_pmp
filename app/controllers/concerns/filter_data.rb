module FilterData
  def load_filter
    controller = params[:controller].split("/").last
    filter_type = Filter.filter_types[controller.to_sym]

    selected_date = if params[:selected_date].blank?
      Date.today.beginning_of_month
    else
      Date.strptime(params[:selected_date], t("date.formats.year_month")).beginning_of_month
    end

    target_params ||= nil

    @filter_service ||= FilterService.new filter_type, current_user,
      params[:id], target_params
  end
end
