module ApplicationHelper

  def user_avatar(user, size = 40)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}")
    else
      "account.png"
    end
  end

  def goal_photo(goal, size = 40)
    if goal.photo.attached?
      goal.photo.variant(resize: "#{size}x#{size}")
    else
      "logo-removedbg.png"
    end
  end
end
