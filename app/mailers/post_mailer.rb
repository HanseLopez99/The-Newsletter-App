class PostMailer < ApplicationMailer
  default from: "new_post@thenewsletterapp.com"

  def new_post(user, post)
    @user = user
    @post = post
    mail(to: @user.email, subject: "Hi #{user.first_name} #{user.last_name}!! A new post has been added to your newsletter!")
  end
end
