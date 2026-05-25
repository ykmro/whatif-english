class User < ApplicationRecord
  has_secure_password

  def increment_login_streak
    today = Date.today

    # 初回ログイン判定
    unless self.last_login_date
      self.login_streak += 1
      self.last_login_date = today
      self.save
      return
    end

    if self.last_login_date == today
      return nil
    elsif self.last_login_date < Date.yesterday
      self.login_streak = 0
    else
      self.login_streak += 1
    end
    self.last_login_date = today
    self.save
  end
end
