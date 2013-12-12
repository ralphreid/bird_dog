$ ->
  $("#submit_hunt_street_selection").on "click", ->
    checked = $(".street_checkbox:checked");
    ids = []
    hunt_id = $("#hunt_id").val()
    $.each checked, (index, element) ->
      ids.push $(element).data("street-id")
    console.log(ids)

    $.post("/hunt_streets", {ids: ids, hunt_id: hunt_id})