module UsersHelper
  def gravatar_url(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
  end
  
  def profile_image(user)
    if user.image?
      image_tag(user.image.thumb.url, alt: "登録したプロフィール画像",
                class: "img-responsive img-rounded")
    else
      image_tag 'noimage.gif'
    end
  end
end