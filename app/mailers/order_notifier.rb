class OrderNotifier < ApplicationMailer
default from: "depot@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #

  def received(order)
    @order = order
    mail to: order.email, subject: "Подтверждение заказа"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #

  def shipped(order)
    @order = order
    mail to: order.email, subject: "Ваш заказ отправлен"
  end
end
