class ConcertMailer < ActionMailer::Base
  default from: 'notifications@example.com'
  # mail to all involved users with that concert
  def changed_status(concert)
    @concert = concert
    @user_array = [@concert.photo_1, @concert.photo_2, @concert.text_1, @concert.text_2, @concert.interview]
    @users = User.where("id in ?", @user_array.uniq).map { |e| e.email  }
    mail(to: @users, subject: "Concert status has been changed",
    body: "Hi concert #{@concert.venue.name} has changed status to #{@concert.status.name}!")
  end

  # mail to admin user/s if someone assigns or unassign to concert
  def assign(concert)
    @concert = concert
    @users = User.where(admin: true).map { |e| e.email  }
    photo1_user = @concert.photo1 != nil ? User.find(@concert.photo1).email : "Nobody"
    photo2_user = @concert.photo2 != nil ?  User.find(@concert.photo2).email : "Nobody"
    text1_user = @concert.text1 != nil ? User.find(@concert.text1).email : "Nobody"
    text2_user = @concert.text2 != nil ? User.find(@concert.text2).email : "Nobody"
    interview_user = @concert.interview != nil ? User.find(@concert.interview).email : "Nobody"
    mail(to: @users, subject: "Concert jobs info",
    body: "Hi, there has been changes in #{@concert.venue.name}.
    Persons assigned to this concert are:
    photo1: #{photo1_user}
    photo2: #{photo2_user}
    text1: #{text1_user}
    text2: #{text2_user}
    interview: #{interview_user}")
  end


  # send email to all users with concert info
  def global_notification(concert)
    @concert = concert
    @users = User.all
    mail(to: @users, subject:"Concert added",
    body: "Hi, there has been added new concert!
    Name: #{@concert.venue.name}
    Date: #{@concert.on_date}
    Status: #{@concert.status.name}
    Bands: #{@concert.bands}")

  end
end
