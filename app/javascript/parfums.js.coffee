$ ->
  $(document).on 'click', '.create-parfum-btn', (e) ->
    parfum_recipe_id = $('input#parfum_recipe_id').val()
    $.ajax
      url: "/parfums/new_parfum_modal"
      dataType: "script"
      type: "GET"
      data:
        parfum_recipe_id: parfum_recipe_id

  $(document).on 'click', '#new-parfum-modal', (e) ->
    $.ajax
      url: "/parfums/new_parfum_modal"
      dataType: "script"
      type: "GET"

  $(document).on 'click', '#new-parfum-material-modal', (e) ->
    $.ajax
      url: "/parfums/new_parfum_materials_modal"
      dataType: "script"
      type: "GET"

  $(document).on 'dblclick', '.parfum-material-item', (e) ->
    if !(e.target.classList.contains('delete-btn') || e.target.classList.contains('show-block-info'))
      id = $(this).attr('data-parfum-material-id')
      $.ajax
        url: "/parfums/edit_parfum_materials_modal"
        dataType: "script"
        type: "GET"
        data:
          id: id

  
  $(document).on 'click', '.refresh-parfum-recipe-modal-data', (e) ->
    url = $(this).attr('data-url')
    $.ajax
      url: "/parfums/refresh_parfum_recipe_modal_data"
      dataType: "script"
      type: "GET"
      data:
        url: url

  $(document).on 'dblclick', '.parfum-item', (e) ->
    if !(e.target.classList.contains('delete-btn') || e.target.classList.contains('show-block-info'))
      id = $(this).attr('data-parfum-id')
      $.ajax
        url: "/parfums/edit_parfum_modal"
        dataType: "script"
        type: "GET"
        data:
          id: id

  $(document).on 'change', '#parfum_drop_avg_ml_ml', (e) ->
    $('#parfum_drop_avg_ml_ml').val($(this).val())
  $(document).on 'keyup', '#parfum_drop_avg_ml_ml', (e) ->
    $('#parfum_drop_avg_ml_ml').val($(this).val())

  $(document).on 'change', '#parfum_material_liquid_material', (e) ->
    if $(this).prop('checked')
      $('.parfum-material-ml').show()
      $('.parfum-material-count').hide()
      $('input#parfum_material_material_name').val('Эфирное масло ')
    else
      $('.parfum-material-ml').hide()
      $('.parfum-material-count').show()
      $('input#parfum_material_material_name').val('Атомайзер ')

  $(document).on 'dblclick', '.delete-parfum-material-btn', (e) ->
    id = $(this).attr('data-parfum-material-id')
    $.ajax
      url: "/parfum_materials/delete_parfum_materials"
      dataType: "script"
      type: "GET"
      data:
        id: id

  $(document).on 'click', '#new-parfum-recipe-modal', (e) ->
    $.ajax
      url: "/parfums/new_parfum_recipes_modal"
      dataType: "script"
      type: "GET"

  $(document).on 'dblclick', '.parfum-recipe-item', (e) ->
    if !(e.target.classList.contains('delete-btn') || e.target.classList.contains('show-block-info'))
      id = $(this).attr('data-parfum-recipe-id')
      $.ajax
        url: "/parfums/edit_parfum_recipes_modal"
        dataType: "script"
        type: "GET"
        data:
          id: id

  $(document).on 'dblclick', '.delete-parfum-recipe-btn', (e) ->
    id = $(this).attr('data-parfum-recipe-id')
    $.ajax
      url: "/parfum_recipes/delete_parfum_recipes"
      dataType: "script"
      type: "GET"
      data:
        id: id

  $(document).on 'dblclick', '.delete-parfum-btn', (e) ->
    id = $(this).attr('data-parfum-id')
    $.ajax
      url: "/parfums/delete_parfum"
      dataType: "script"
      type: "GET"
      data:
        id: id

  $(document).on 'click', 'span.one-drop-info', (e) ->
    if e.target.classList.contains('one-drop-info')
      $.ajax
        url: "/parfums/change_one_drop_info"
        dataType: "script"
        type: "GET"

  $(document).on 'click', '.show-block-info', (e) ->
    block_item_info = $(this).parents('div.group-for-block').children('div.block-item-info')
    if block_item_info.hasClass('show-down')
      block_item_info.toggleClass('show-down')
      setTimeout ->
        block_item_info.toggle()
      , 250
    else
      block_item_info.toggle()
      setTimeout ->
        block_item_info.toggleClass('show-down')
      , 100

  $(document).on 'keyup', '.parfum_recipe_input', (e) ->
    one_drop_info = $('.one-drop-info').attr('data-one-drop')
    input = $(this)
    input_label = input.parents('.multi-select-item').children('div')
    input_label_text = input_label.attr('data-label-name')

    if input.val() != ''
      new_input_label = $('<span />')
      new_input_label = new_input_label.append($('<span />').html(input_label_text))

      ml_count = (Number(input.val()) / Number(one_drop_info)).toFixed(2)
      new_input_label_one_drop_info = "(#{$(this).val()}мл = #{ml_count} капель)"
      new_input_label = new_input_label.append($('<span />').addClass('text-small').addClass('text-muted').html(new_input_label_one_drop_info))
      input_label.html(new_input_label)
    else
      input_label.html(input_label_text)

  $(document).on 'click', '.calc-ml', (e) ->
    $.ajax
      url: "/parfums/calc_ml_modal"
      dataType: "script"
      type: "GET"

  $(document).on 'keyup', '.parfum-calc-drops', (e) ->
    one_drop_info = Number($('.one-drop-info').attr('data-one-drop'))
    parfum_calc_drops_input = $('.parfum-calc-drops')
    parfum_calc_mls_input = $('.parfum-calc-mls')

    mls_count = (Number(parfum_calc_drops_input.val()) * Number(one_drop_info)).toFixed(2)
    parfum_calc_mls_input.val(mls_count)

  $(document).on 'keyup', '.parfum-calc-mls', (e) ->
    one_drop_info = Number($('.one-drop-info').attr('data-one-drop'))
    parfum_calc_drops_input = $('.parfum-calc-drops')
    parfum_calc_mls_input = $('.parfum-calc-mls')

    drops_count = (Number(parfum_calc_mls_input.val() / Number(one_drop_info)) ).toFixed(2)
    parfum_calc_drops_input.val(drops_count)