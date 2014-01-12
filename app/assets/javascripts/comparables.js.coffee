$ ->
  $("#add_comparable").on "click", ->
    checked = $(".property_checkbox:checked");
    ids = []
    property_id = $(this).data("id")
    $.each checked, (index, element) -> ids.push $(element).data("property-id")
    post = $.post("/properties/"+property_id+"/add_comparable", { ids: ids, property_id: property_id })
    post.done (data) -> 
      console.log (data)
      window.location.href = "/properties/#{property_id}"
    post.fail ->
      console.log ('failure')
