module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def current_panel

  end

  def active_sub_menu(params)
    if controller.controller_name == params
      return "active"
    else
      return ""
    end
  end

  def active_left_bar(params)
    if controller.controller_name == params
      return "class=active"
    elsif params == "job_sites" && job_site_show
      return "class=active"
    else
      return ""
    end
  end
end