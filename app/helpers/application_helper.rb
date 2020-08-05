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
end
