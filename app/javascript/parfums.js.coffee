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