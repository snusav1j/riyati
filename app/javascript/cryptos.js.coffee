# donut_chart = document.getElementById('dashboard-total-donut-chart')

# new Chart donut_chart, 
#   type: 'doughnut'
#   data: 
#     datasets: [
#       {
#         data: [12, 19, 3, 5, 2, 3]
#         borderWidth: 0
#       }
#     ]
#   options: 
#     responsive: true
# $ ->

# bar_chart = document.getElementById('dashboard-bar-chart')

# new Chart bar_chart,
#   type: 'line'
#   data:
#     labels: ['test', 'test', 'test', 'test', 'test', 'test']
#     datasets: [
#       {
#         label: 'test #'
#         data: [12, 19, 3, 5, 2, 3]
#         borderWidth: 0
#       }
#     ]
#   options:
#     scales:
#       x:
#         maxBarThickness: 30
#         # categoryPercentage: 0.5
#       y:
#         beginAtZero: true

# $(window).on 'load', (e) ->
  # if (($(location).attr('href').toLowerCase().indexOf("users/") >= 0) == false) && $(location).attr('href').toLowerCase().indexOf("users") >= 0
  #   setInterval ->
  #     $.ajax
  #       url: "/cryptos/refresh_user_total_equity"
  #       type: "GET"
  #       dataType: "json"
  #       async: false
  #       success: (data) ->
  #         console.log(data)
  #         if data != undefined
  #           $('#user_total_equity').html("$#{data.data}")
  #   , 3000

  # if $(location).attr('href').toLowerCase().indexOf("cryptos") >= 0
  #   setInterval ->
  #     $.ajax
  #       url: "/cryptos/refresh_total_equity"
  #       type: "GET"
  #       dataType: "json"
  #       async: false
  #       success: (data) ->
  #         if data != undefined
  #           $('#total_crypto_equity').html("$#{data.data}")
  #   , 3000
    
$ ->