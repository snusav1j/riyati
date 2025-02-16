$ ->
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
