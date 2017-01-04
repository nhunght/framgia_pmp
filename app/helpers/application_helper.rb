module ApplicationHelper
  def full_title page_title = ""
    base_title = t "project_name"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def flash_class level
    case level
    when :notice then "alert-info"
    when :error then "alert-error"
    when :alert then "alert-warning"
    when :success then "alert-success"
    when :failed then "alert-danger"
    end
  end

  def activity_class task
    assignee = task.user
    estimate, remaining = task.actual_time, task.remaining_time

    if assignee.nil?
      estimate != 0 ? (remaining != 0 ? "estimated" : "default") : "default"
    else
      estimate != 0 ? (remaining != 0 ? "processed" : "default") : "assigned"
    end
  end

  def product_backlog_class product_backlog
    return "default" if product_backlog.tasks.empty?

    actual_time = product_backlog.actual
    remaining_time = product_backlog.total_remaining_time

    if remaining_time.zero? && actual_time != 0
      "finished"
    elsif remaining_time != 0 && actual_time != 0
      "in_progress"
    end
  end

  def flash_message flash_type, *params
    if params.empty?
      t "flashs.messages.#{flash_type}", model_name: controller_name.classify
    else
      models_name = params[0].join(", ") unless params[0].empty?
      t "flashs.messages.#{flash_type}", models_name: models_name
    end
  end

  def tab_active tab_name, current_tab
    current_tab == tab_name ? "active" : nil
  end

  def verity_admin?
    if current_user.member?
      redirect_to root_url
      flash[:success] = t "sessions.not_admin"
    end
  end

  def home_page
    if current_user.nil? || !current_user.is_root?
      root_path
    else
      admin_projects_path
    end
  end

  def filter_selector_name element, value_field
    return if element.nil?
    if element.try(value_field).kind_of?(Date) || element.kind_of?(Date)
      return (element.try(value_field)
        .strftime(t "date.formats.default") rescue element.strftime(t "date.formats.default"))
    end
    element.try(value_field).strip rescue element.to_s.strip
  end

  def filter_title
    @filter_service.is_on? ? t("filters.btn_off") : t("filters.btn_on")
  end
end
