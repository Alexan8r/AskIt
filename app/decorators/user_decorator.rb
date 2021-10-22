# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all
  def name_or_email
    if name.present?
      name
    else
      email.split('@')[0]
    end
  end

  def gravatar(size: 30, css_class: '')
    h.image_tag "https://www.gravatar.com/avatar/#{gravatar_hash}.jpg?s=#{size}",
                class: "rounded #{css_class}", alt: name_or_email
  end
end
