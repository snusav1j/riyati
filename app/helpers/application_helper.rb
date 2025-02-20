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

  def get_donut_chart(model_group, width, height)
    donut_chart model_group.count,
    class: 'box',
    height: "#{height}px",
    width: "#{width}px",
    options: {
      legend: {
        bottom: '0'
      },
      emphasis: {
        itemStyle: {
          shadowBlur: 0,
          shadowOffsetX: 0
        }
      }
    }
  end

  def get_donut_chart(model_group)
    donut_chart model_group.count,
    class: 'box',
    renderer: 'svg',
    height: "100%",
    width: "100%",
    options: {
      series: {
        type: 'pie',
        radius: ['40%', '90%'],
        avoidLabelOverlap: false,
        padAngle: 5,
        itemStyle: {
          borderRadius: 2
        },
        label: {
          show: false,
          position: 'center'
        },
        labelLine: {
          show: false
        }
      },
      tooltip: {
        trigger: 'item'
      },
      labelLine: {
        show: false
      },
      emphasis: {
        itemStyle: {
          shadowBlur: 0,
          shadowOffsetX: 0
        }
      }
    }
  end

end
