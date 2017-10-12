class UserMailerPreview < ActionMailer::Preview
  def confirm_order_email
    UserMailer.confirm_order_email(Order.last)
  end
end