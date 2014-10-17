module ApplicationHelper

  def format_datetime(time)
    time.strftime("%B %e, %Y at %l:%M %P")
  end

  def format_time(datetime)
    datetime.strftime("%l:%M %P")
  end

  def format_date(datetime)
    datetime.strftime("%b %d, %Y")
  end

  def format_duration(duration)
    minutes = (duration % 60)
    hours = (duration / 60)

    if hours > 0 && minutes != 0
      "#{hours} h #{minutes} min"
    elsif hours >0 && minutes == 0
      "#{hours} h"
    else
      "#{minutes} min"
    end
  end

end
