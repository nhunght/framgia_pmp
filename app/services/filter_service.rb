class FilterService
  def initialize filter_type, user, target_id, target_params
    @filter_type, @user, @target_id, @target_params = filter_type, user, target_id, target_params
  end

  def save data
    filter_data = @user.filters.find_or_create_by filter_type: @filter_type,
                                                  target_id: @target_id
    filter_data.update_attributes content: data.to_json
  end

  def fetch
    JSON.load user_filter.try(:content)
  end

  def project_filter_data
    Project.select :customer, :name, :manager
  end

  def user_filter_data
    user_filter.try :content
  end

  def is_on?
    user_filter.is_turn_on? rescue true
  end

  def assignee_project_data
    @user.filters.assignee_project.first.try :content
  end

  private
  def user_filter
    @user.filters.find_by filter_type: @filter_type, target_id: @target_id, target_params: @target_params
  end
end
