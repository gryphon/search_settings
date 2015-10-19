$ ->
  $("#search-fields form").on "ajax:success", (e, data, status, xhr) ->
    location.reload()