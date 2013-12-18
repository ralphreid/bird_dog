$ ->
  $("#submit_hunt_street_selection").on "click", ->
    checked = $(".street_checkbox:checked");
    ids = []
    hunt_id = $("#hunt_id").val()
    $.each checked, (index, element) ->
      ids.push $(element).data("street-id")
    
    $.post("/hunts/add_street", {ids: ids, hunt_id: hunt_id})
    window.location.href = "/hunts/#{hunt_id}"

# SAME LOGIC BUT FOR COMPARABLES (PROPERTIES#SHOW)
  $("#add_comparable").on "click", ->
    checked = $(".property_checkbox:checked");
    ids = []
    property_id = $(this).data("id")
    $.each checked, (index, element) -> ids.push $(element).data("property-id")
    console.log("ids", ids)
    $.post("/properties/"+property_id+"/add_comparable", { ids: ids, property_id: property_id })
