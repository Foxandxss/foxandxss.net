jQuery ->
  $(".error").each (index, value) ->
    $(value).siblings().addClass 'error'