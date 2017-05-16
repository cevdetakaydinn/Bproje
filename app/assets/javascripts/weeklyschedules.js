$( document ).ready(function() {
    $('#anything_university').change(function()
    {

      var value = $(this).val();
      $.ajax({
        url: '/weeklyschedules/listFacilities',
        data: {university_id: value},
        dataType: "json",
        method: 'get',

        success: function (data) {
          fill_up_form_fac(data);
        }
      });
    }
  );
  $('#anything_facility').change(function()
  {

    var value = $(this).val();
    $.ajax({
      url: '/weeklyschedules/listDepartments',
      data: {facility_id: value},
      dataType: "json",
      method: 'get',

      success: function (data) {
        fill_up_form_dep(data);
      }
    });
  }
  );


});



function fill_up_form_fac(data)
{
  $("#anything_facility").empty();
    for(var i in data)
      {
        var id = data[i].id;
        var name = data[i].name;

        $("#anything_facility").append(new Option(name, id));
      }
};


function fill_up_form_dep(data)
{
  $("#anything_department").empty();
    for(var i in data)
      {
        var id = data[i].id;
        var name = data[i].name;

        $("#anything_department").append(new Option(name, id));
      }
};
