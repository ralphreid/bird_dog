$ ->
  $("#add_comparable").on "click", ->
    checked = $(".property_checkbox:checked");
    ids = []
    property_id = $(this).data("id")
    $.each checked, (index, element) -> ids.push $(element).data("property-id")
    $.post("/properties/"+property_id+"/add_comparable", { ids: ids, property_id: property_id })
    window.location.href = "/properties/#{id}"
