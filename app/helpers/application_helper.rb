module ApplicationHelper

  def format_datetime(time)
    time.strftime("%B %e, %Y at %l:%M:%S %p")
  end

  def format_time(datetime)
    datetime.strftime("%l:%M %p")
  end

  def format_date(datetime)
    datetime.strftime("%b %d, %Y")
  end

end
