$ ->
  $("#submit_hunt_property_selection").on "click", ->
    checked = $(".property_checkbox:checked")
    ids = []
    hunt_id = $("#hunt_id").val()
    $.each checked, (index, element) ->
      ids.push $(element).data("property-id")

    $.post("/hunts/add_property", {ids: ids, hunt_id: hunt_id})
    window.location.href = "/hunts/#{hunt_id}"