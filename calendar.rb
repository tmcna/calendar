require 'date'

class Calendar

  WIDTH = 3 * 7

  def initialize(year, month)
    @first = Date.new(year, month)
    @last  = Date.new(year, month, -1)
  end

  def to_s
    calendar  = @first.strftime("%B %Y").center(WIDTH) + "\n"
    calendar += "Su Mo Tu We Th Fr Sa" + "\n"

    if @first.wday != 0
      @first.wday.times do
        calendar += "   "
      end
    end

    for d in 1..@last.day do
      if @first.wday == 6
        calendar += sprintf("%2s ",d)+"\n"
      else
        calendar += sprintf("%2s ",d)
      end
      @first = @first.next
    end

    puts calendar
  end

end
