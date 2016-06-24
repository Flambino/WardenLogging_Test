class LockedStrategy < Warden::Strategies::Base
  def valid?
    false
  end

  def authenticate!
    fail! message: "strategies.locked.failed"
  end
end

Warden::Strategies.add(:locked, LockedStrategy)
