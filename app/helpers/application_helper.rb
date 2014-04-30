module ApplicationHelper
  
  def body_tag(&block)
    content_tag :body, class: body_class,
    data: { controller: is_controller_name, action: is_action_name } do
      yield
    end
  end

  private

  def body_class
    "#{is_controller_name}_#{is_action_name}"
  end

  def is_controller_name
    params[:controller].gsub('/', '_')
  end

  def is_action_name
    return 'new'  if action_name == 'create'
    return 'edit' if action_name == 'update'
    action_name
  end

end
