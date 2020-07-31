module ApplicationHelper
  def image_avatar(user)
    if user.avatar.attached?
      image_tag user.avatar, style: 'width: 100px; height: 100px', class: 'rounded-circle'
    else
      fa_icon 'user', class: 'fa-3x'
    end
  end
end
