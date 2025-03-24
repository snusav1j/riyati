$ ->
  check_icon = '<i class="fa fa-check"></i>'
  remove_icon = '<i class="fa fa-remove"></i>'
  warning_icon = '<i class="fa fa-warning"></i>'
  info_icon= '<i class="fa fa-info"></i>'
  ( ($) ->
    $.fn.toastr = (stauts='', msg='') ->
      $('.custom-toastr-container').remove()

      toastr_count = $('.custom-toastr-container').length

      toastr_container = $('<div />').addClass('custom-toastr-container')
      toastr_block = $('<div />').addClass("custom-toastr-#{stauts}").addClass('custom-toastr-block')
      toastr_block = toastr_block.append(msg)
      toastr_icon_block = $('<div />').addClass('custom-toastr-icon')
      if stauts == 'success'
        toastr_block.prepend(toastr_icon_block.append(check_icon))
      if stauts == 'danger'
        toastr_block.prepend(toastr_icon_block.append(remove_icon))
      if stauts == 'warning'
        toastr_block.prepend(toastr_icon_block.append(warning_icon))
      if stauts == 'primary'
        toastr_block.prepend(toastr_icon_block.append(info_icon))

      toastr_container.append(toastr_block)

      $('body').prepend(toastr_container)
      setTimeout ->
        toastr_container.addClass('show-toastr-container')
        # toastr_container.last().css('top', toastr_count * 45)
      , 50
      setTimeout ->
        toastr_container.last().removeClass('show-toastr-container')
      , 2600
      setTimeout ->
        toastr_container.last().remove()
      , 3100
  )(jQuery)


  $(document).on 'click', '.custom-toastr-container', (e) ->
    $(this).removeClass('show-toastr-container')
    setTimeout ->
      $(e.target).remove()
    , 300