module ApplicationHelper
  private

  def image_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar, style: 'width: 100px; height: 100px', class: 'rounded-circle'
    else
      fa_icon 'user', class: 'fa-3x'
    end
  end

  def available_categories(decor)
    category_ids = decor.categories.pluck(:category_id)
    Category.all.reject { |value| category_ids.include?(value.id) }
  end

  def icon_display(decor)
    if decor.categories.empty?
      fa_icon 'times', class: 'fa-3x'
    else
      fa_icon decor.categories.first.icon, class: 'fa-3x'
    end
  end

  def decor_errors_msgs(decor)
    render 'decors/error_msgs' if decor.errors.full_messages.any?
  end

  def category_errors_msgs(category)
    render 'categories/error_msgs' if category.errors.any?
  end
end
