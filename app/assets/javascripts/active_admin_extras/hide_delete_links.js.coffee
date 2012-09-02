jQuery ->
  $('.blogs_count').each (index, value) ->
    if $(value).text != 0
      $(value).closest("tr").find("td:last-child").find(".delete_link").remove()

  $('.pages_count').each (index, value) ->
    if $(value).text != 0
      $(value).closest("tr").find("td:last-child").find(".delete_link").remove()