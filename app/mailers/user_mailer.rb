class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def confirm_order_email(order)
    @order = order
    mail(to: @order.email, subject: "Your Order Number #{@order.id} succesfully has been placed")
  end

end
