$(document).ready(function(){

  $('#statistic_result_pannel').hide();
  //init date range picker
  $('#date_range').daterangepicker({
      autoUpdateInput: false,
      linkedCalendars: false,
      'locale': {
          'cancelLabel': 'Xóa',
          'applyLabel': 'Chọn',
           'daysOfWeek': [
            'CN',
            'T2',
            'T3',
            'T4',
            'T5',
            'T6',
            'T7'
        ],
        'monthNames': [
            'Tháng 1',
            'Tháng 2',
            'Tháng 3',
            'Tháng 4',
            'Tháng 5',
            'Tháng 6',
            'Tháng 7',
            'Tháng 8',
            'Tháng 9',
            'Tháng 10',
            'Tháng 11',
            'Tháng 12'
        ],
      }
    });
  $('#date_range').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('YYYY-MM-DD') + ' - ' + picker.endDate.format('YYYY-MM-DD'));
  });

  $('#date_range').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
  });  

  // validation jquery rule   
   $( "#form_company" ).validate({
    ignore: [], 
        rules: {         
          date_range: {
            required: true,
          },  
                      
        },
        messages: {        
          date_range: {
            required: "Vui lòng chọn mốc thời gian !",
          },
          
        },
        errorElement: "em",
        errorPlacement: function ( error, element ) {
          // Add the `help-block` class to the error element
          error.addClass( "help-block" );

          if ( element.prop( "type" ) === "checkbox" ) {
            error.insertAfter( element.parent( "label" ) );
          } else {
            error.insertAfter( element );
          }
        },
        highlight: function ( element, errorClass, validClass ) {
          $( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
        },
        unhighlight: function (element, errorClass, validClass) {
          $( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
        }
      });
  //end validation jquery rule  

  // On page load: form validation
  jQuery.validator.setDefaults({
    success: 'valid',
    rules: {
      fiscal_year: {
        required: true,
        min:      2000,
        max:      2025
      }
    },
    errorPlacement: function(error, element){
      error.insertBefore(element);
    },
    highlight: function(element){
      $(element).parent('.field_container').removeClass('valid').addClass('error');
    },
    unhighlight: function(element){
      $(element).parent('.field_container').addClass('valid').removeClass('error');
    }
  });
  var form_company = $('#form_company');


 
// Add company submit form
$('#create_statistic').click( function(e){
    e.preventDefault();
    // Validate form
    if (form_company.valid() == true){

      var endDate = $('#date_range').data('daterangepicker').endDate._d;
      // Send company information to database
      var request   = $.ajax({
          url: 'allpages/customers_statistic/data.php',
          type: 'post',
          data: form_company.serialize(),
          dataType: 'json',
      });

      request.done(function(output){
        
      $('#statistic_result_pannel').show();
      $('#customers_total_quantity').html(output.total_quantity);
      $('#customers_total_income').html(output.total_income);


      // write table
      var dataSet = output.data;

      var table_companies = $('#table_companies').dataTable({
        "data": dataSet,
        "columns": [
            { "data": "customer_fullname" },
            { "data": "customer_phone" },
            { "data": "customer_total_quantity"},
            { "data": "customer_total_income"},                   
        ], 
        "aoColumnDefs": [
         
        ],
        "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
        "oLanguage": {
          "sSearch": "Tìm kiếm: ",
          "oPaginate": {
            "sFirst":       "Trang đầu",
            "sPrevious":    "<",
            "sNext":        ">",
            "sLast":        "Trang cuối",
          },
          "sLengthMenu":    "Số dòng hiển thị mỗi trang: _MENU_",
          "sInfo":          "Tổng số _TOTAL_ dòng (Hiển thị từ dòng _START_ đến _END_)",
          "sInfoFiltered":  "(Lọc từ _MAX_ dòng)"
        }
      });

      request.fail(function(jqXHR, textStatus){
        hide_loading_message();
        show_message('Add request failed : ' + textStatus, 'error');
      });





    });

  }
});


});