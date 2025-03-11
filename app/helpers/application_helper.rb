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

  def total_materials_expense
    expense = 0
    ParfumMaterial.all.each do |material|
      expense += material.expense if material.expense.present?
    end
    expense
  end

  def total_recipe_materials_expense
    expense = 0
    ParfumRecipe.all.each do |recipe|
      expense += recipe.get_recipe_expense
    end
    expense
  end

  def get_donut_chart(model_group)
    donut_chart model_group.count,
    class: 'chart-box',
    # id: 'chart-container',
    renderer: 'canvas',
    height: "250px",
    width: "250px",
    
    options: {
      # legend: {
      #   orient: 'vertical',
      #   left: 'left'
      # },
      series: {
        type: 'pie',
        radius: '55%',
        roseType: 'radius',
        center: ['50%', '50%'],
        # animationType: 'scale',
        # animationEasing: 'elasticOut',
        # animationDelay: 500,
        height: "100%",
        width: "100%",
        type: 'pie',
        radius: ['45%', '95%'],
        avoidLabelOverlap: false,
        padAngle: 5,
        itemStyle: {
          borderRadius: 2
        },
        label: {
          show: false,
          position: 'center'
        },
        # itemStyle: {
        #   color: '#c23531',
        #   shadowColor: 'rgba(0, 0, 0, 0.5)'
        # },
        # labelLine: {
        #   show: true
        # },
        labelLine: {
          lineStyle: {
            # color: 'rgba(255, 255, 255, 0.3)'
          },
          smooth: 0.2,
          length: 10,
          length2: 20
        },
      },
      tooltip: {
        trigger: 'item'
      },
      # visualMap: {
      #   show: false,
      #   min: 80,
      #   max: 600,
      #   inRange: {
      #     colorLightness: [0, 1]
      #   }
      # },
      
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

  def svg(path)
    File.open("#{path}", "rb") do |file|
      raw file.read
    end
  end

  def show_style
    'border: 3px solid #17466b !important;'
  end

end
