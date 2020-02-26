class Transfer
  
  attr_reader :amount, :sender, :receiver
  attr_accessor :status
  
  def initialize (sender, receiver, amount)
      @status = "pending"
      @amount = amount
      @sender = sender 
      @receiver = receiver 
  end
  
  def valid? 
      sender.valid? && receiver.valid?
  end
  
  def execute_transaction 
      if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount 
      receiver.balance += amount 
      self.status = "complete"
    else 
      reject_transfer 
  end
  end
  
  def reject_transfer
      self.status = "rejected"
      "Transaction rejected. Please check your amount balance."
  end
  end
  
  
  
  
  
  
  
end
