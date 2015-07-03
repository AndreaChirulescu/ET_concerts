class ConcertMailer < ActionMailer::Base
  default from: 'notifications@example.com'
  # mail to all involved users with that concert
  def changed_status(concert)
    @concert = concert
    @user_array = [@concert.photo_1, @concert.photo_2, @concert.text_1, @concert.text_2, @concert.interview]
    @users = User.where("id in ?", @user_array.uniq).map { |e| e.email  }
    mail(to: @users, subject: "Concert status has been changed")
  end

  # mail to admin user if someone assigns or unassign to concert
  def assign(concert)
    @concert = concert
    @users = User.where(admin: true).map { |e| e.email  }
    mail(to: @users, subject: "Concert jobs info")
  end


  # send email to all users with concert info
  def global_notification(concert)
    @concert = concert
    @users = User.all
    mail(to: @users, subject:"Concert added")

  end
end
