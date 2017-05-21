require "pry"

class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :sender, :receiver, :amount_record

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
    @amount_record = amount
  end

  def valid?
    if sender.valid? && receiver.valid? && sender.balance > amount
      true
    else false
    end
  end

  def execute_transaction
    if self.valid?
      sender.balance -= amount
      receiver.balance += amount
      self.amount = 0
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount_record
      receiver.balance -= amount_record
      self.status = "reversed"
    else
    end
  end

end
