module ApplicationHelper
  def hide_sidebar?
    (controller_name == 'pages') || (controller_name == 'registrations') || ((controller_name == 'sessions') && action_name == 'new')
  end
  def active_class(link_path)
    return unless request.path.include?(link_path.to_s)
		'active'
  end
end
