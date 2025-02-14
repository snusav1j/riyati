module ApplicationHelper
  def pretty_date(date)
		Russian::strftime(date, "%d %B %Y") if date.present?
  end

  def pretty_date_month_year(date)
		Russian::strftime(date, "%B %Y") if date.present?
  end

  def pretty_number(number, delimiter = '')
    number_to_currency number, precision: 0, delimiter: delimiter, unit: ""
  end

  def pretty_decimal(number, separator = '.', delimiter = '')
    NumberHelper.number_to_currency number, precision: 2, delimiter: delimiter, unit: "", separator: separator
  end

  def pretty_date_time(date)
    Russian::strftime(date, "%d %B %Y %H:%M") if date.present?
  end

  def small_date(date)
    date = date.to_datetime + 3.hours
    date.strftime("%d.%m.%Y") if date.present?
  end

  def time_only(date)
    date = date.to_datetime + 3.hours
    date.strftime("%H:%M") if date.present?
  end

  def smallest_date(date)
    date = date.to_datetime + 3.hours
    date.strftime("%d.%m") if date.present?
  end

  def small_datetime(date)
    date = date.to_datetime + 3.hours
    date.strftime("%d.%m.%Y %H:%M") if date.present?
  end
end
