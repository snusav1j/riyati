# $ ->
#   loader_btn_html = '<div class="loader"><i class="fa fa-circle-o-notch fa-spin"></i></div>'
#   $(document).ready ->
#     $.ajax
#       url: "/cryptos/get_main_prices"
#       dataType: "script"
#       type: "GET"

#   $(document).ready ->
#     user_id = $('#user_id').text()
#     if user_id != ''
#       $.ajax
#         url: "/users/get_user_coins"
#         dataType: "script"
#         type: "GET"
#         data:
#           user_id: user_id

#   $(document).on 'click', '#refresh-main-prices-btn', (e) ->
#     $('#dop-control-panel .main-prices').html(loader_btn_html)
#     $.ajax
#       url: "/cryptos/get_main_prices"
#       dataType: "script"
#       type: "GET"

#   $(document).on 'click', '.coin-block .show-coin-info', (e) ->
#     symbol = $(this).attr('data-symbol')
#     $(this).children('.btn').hide()
#     $(this).children('.loader').show()
#     $('.show-coin-info').prop('disabled', true)
#     $.ajax
#       url: "/cryptos/coin_info_modal"
#       dataType: "script"
#       type: "GET"
#       data:
#         symbol: symbol
#       success: (data) ->
#         $(".show-coin-info[data-symbol='#{symbol}']").children('.btn').show()
#         $(".show-coin-info[data-symbol='#{symbol}']").children('.loader').hide()
#         $('.show-coin-info').prop('disabled', false)
#       error: (data) ->
#         $(".show-coin-info[data-symbol='#{symbol}']").children('.btn').show()
#         $(".show-coin-info[data-symbol='#{symbol}']").children('.loader').hide()
#         $('.show-coin-info').prop('disabled', false)


#   $(document).on 'click', '#find-crypto-modal-btn', (e) ->
#     $.ajax
#       url: "/cryptos/crypto_modal"
#       dataType: "script"
#       type: "GET"

#   $(document).on 'click', '.add-coin', (e) ->
#     symbol = $(this).attr('data-symbol')
#     $(this).children('.btn').hide()
#     $(this).children('.loader').show()
#     $.ajax
#       url: "/cryptos/add_coin"
#       dataType: "script"
#       type: "GET"
#       data:
#         symbol: symbol
#       success: (data) ->
#         $(".show-coin-info[data-symbol='#{symbol}']").children('.btn').show()
#         $(".show-coin-info[data-symbol='#{symbol}']").children('.loader').hide()
#       error: (data) ->
#         $(".show-coin-info[data-symbol='#{symbol}']").children('.btn').show()
#         $(".show-coin-info[data-symbol='#{symbol}']").children('.loader').hide()
        
#   $(document).on 'submit', 'form#search-coins', (e) ->
#     loader_btn = $('#coin-search-btn .loader')
#     btn_icon = $('#coin-search-btn .btn-icon')
#     loader_btn.show()
#     btn_icon.hide()
#     $('#coin-search-btn button').prop('disabled', true)


