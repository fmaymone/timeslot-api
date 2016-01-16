class SharePolicy < ApplicationPolicy

  # allow all (public contents)
  def redirect?
    true
  end

  # true if a user is logged in
  def webview?
    current_user?
  end

  # true if a user is logged in
  def image?
    current_user?
  end

  # true if a user is logged in
  def qrcode?
    current_user?
  end

  # true if a user is logged in
  def email?
    current_user?
  end

  # true if a user is logged in
  def pdf?
    current_user?
  end

  # true if a user is logged in
  def url?
    current_user?
  end
end
