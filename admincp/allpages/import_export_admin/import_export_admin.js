$(document).ready(function(){

$("#import_result_pannel").hide();
//handle import with ajax
$('#button_import').click(function(){
//   jquery validation rules
$( "#form_import" ).validate( {
  ignore: [],
  rules: {         
    file: {
      required: true,
    },
  },
  messages: {        
    file: {
      required: "Vui lòng chọn file !",
    }, 
  },        
  errorElement: "em",
  errorPlacement: function ( error, element ) {
    // Add the `help-block` class to the error element
    error.addClass( "help-block" );
    error.insertAfter( element );
  },
  highlight: function ( element, errorClass, validClass ) {
    $( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
  },
  unhighlight: function (element, errorClass, validClass) {
    $( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
  }
});
//end jquery validation rules
if ( $('#form_import').valid() == true){

  var form = $('#form_import')[0];
  var formData = new FormData(form);
  request = $.ajax({
    url: 'allpages/import_export_admin/import_admin.php',
    data: formData,
    type: 'POST',
    contentType:  'application/json; charset=utf-8',
    contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    processData: false, // NEEDED, DON'T OMIT THIS
    // ... Other options like success and etc
  });

  request.done(function(output){
    console.log(output);
    $("#import_result_content").html(output);
    $("#import_result_pannel").show();
  });
  request.fail(function(jqXHR, textStatus){
    alert('request fail !');
  });

}
}); 	

});