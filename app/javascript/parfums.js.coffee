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

  $(document).on 'click', '.parfum-material-item', (e) ->
    if !e.target.classList.contains('delete-btn')
      id = $(this).attr('data-parfum-material-id')
      $.ajax
        url: "/parfums/edit_parfum_materials_modal"
        dataType: "script"
        type: "GET"
        data:
          id: id

  $(document).on 'click', '.parfum-item', (e) ->
    if !e.target.classList.contains('delete-btn')
      
      id = $(this).attr('data-parfum-id')
      $.ajax
        url: "/parfums/edit_parfum_modal"
        dataType: "script"
        type: "GET"
        data:
          id: id

  $(document).on 'click', '.delete-parfum-material-btn', (e) ->
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

  $(document).on 'click', '.parfum-recipe-item', (e) ->
    if !e.target.classList.contains('delete-btn')
      id = $(this).attr('data-parfum-recipe-id')
      $.ajax
        url: "/parfums/edit_parfum_recipes_modal"
        dataType: "script"
        type: "GET"
        data:
          id: id

  $(document).on 'click', '.delete-parfum-recipe-btn', (e) ->
    id = $(this).attr('data-parfum-recipe-id')
    $.ajax
      url: "/parfum_recipes/delete_parfum_recipes"
      dataType: "script"
      type: "GET"
      data:
        id: id

  $(document).on 'click', '.delete-parfum-btn', (e) ->
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