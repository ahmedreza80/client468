var  selectedCity = "";
<% if product.city.present? %>
  selectedCity = <%= product.city  %>;
<% end %>
var  selectedArea = "";
<% if product.area.present? %>
selectedArea = <%= product.area  %>;
<% end %>
$(function() {
  if ($("select#state").val() == "") {
    $("select#city option").remove();
    var row = "<option value=\"" + "" + "\">" + "city" + "</option>";
    $(row).appendTo("select#city");
   }
   var $val = $("select#state").val();
   if($val != ""){
     getCitiesOfState($val);
   }
   
   $("select#state").change(function() {
    var id_value_string = $(this).val();
    if (id_value_string == "") {
     $("select#city option").remove();
     var row = "<option value=\"" + "" + "\">" + "city" + "</option>";
     $(row).appendTo("select#city");
    } else {
     // Send the request and update city dropdown
      getCitiesOfState(id_value_string)
    }
   });
  if ($("select#city").val() == "" && selectedCity == "") {
    $("select#area option").remove();
    var row = "<option value=\"" + "" + "\">" + "area" + "</option>";
    $(row).appendTo("select#area");
   }
   var $val2 = $("select#city").val();
   console.log("val________", $val2);
   if($val2 != "" && selectedCity == ""){
    getAreasOfCity($val2)
   }
   console.log("selected_city________", selectedCity);
   if (selectedCity != "") {
    
    getAreasOfCity(selectedCity)
   }
    $("select#city").change(function() {
      var id_value_string = $(this).val();
      if (id_value_string == "") {
        $("select#area option").remove();
        var row = "<option value=\"" + "" + "\">" + "area" + "</option>";
        $(row).appendTo("select#area");
      } else {
        // Send the request and update city dropdown
        getAreasOfCity(id_value_string)
        
      }
    });
  });  
