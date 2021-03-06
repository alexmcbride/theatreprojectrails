module ApplicationHelper
  def form_errors(obj)
    if obj.errors.any?
      content_tag(:div, class: "panel panel-danger") do
        concat(content_tag(:div, class: "panel-heading") do
          concat(content_tag(:h4, class: "panel-title") do
            concat "#{pluralize(obj.errors.count, "error")} prohibited this #{obj.class.name.downcase} from being saved:"
          end)
        end)
        concat(content_tag(:div, class: "panel-body") do
          concat(content_tag(:ul) do
            obj.errors.full_messages.each do |msg|
              concat content_tag(:li, msg)
            end
          end)
        end)
      end
    end
  end

  def user_can_edit(record)
    user_signed_in? and (current_user.has_role? :admin or current_user.has_role? :can_edit, record)
  end

  def user_can_comment
    user_signed_in? and current_user.has_role? :member
  end

  def user_is_admin
    user_signed_in? and current_user.has_role? :admin
  end
end
