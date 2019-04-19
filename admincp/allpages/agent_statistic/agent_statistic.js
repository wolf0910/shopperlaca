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
          id_agent: {
            required: true,
          },
                      
        },
        messages: {        
          date_range: {
            required: "Vui lòng chọn mốc thời gian !",
          },
          id_agent: {
            required: "Vui lòng chọn đại lý !",
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

      
      // Send company information to database
      var request   = $.ajax({
          url: 'allpages/agent_statistic/data.php',
          type: 'post',
          data: form_company.serialize(),
          dataType: 'json',
      });

      request.done(function(output){
        
      $('#statistic_result_pannel').show();
      $('#agents_total_quantity').html(output.total_quantity);
      $('#agents_total_income').html(output.total_income);

      // write the chart
      $('#morris-bar').empty();
      $('#morris-bar2').empty();

      var chart_data_income = [];  
      var chart_data_quantity = [];          
              
      
      for(var i = 0; i < output.data.length; i++) {  
           var row = output.data[i];
           
           var obj = {
                y: row.category_name,
                a: row.agent_total_income,              
           };   
           var obj2 = {
                y: row.category_name,
                a: row.agent_total_quantity,              
           }; 

           chart_data_income.push(obj);
           chart_data_quantity.push(obj2);
      }
     

      Morris.Bar({
            element: 'morris-bar',
            data: chart_data_income,
            xkey: 'y',
            ykeys: ['a'],
            labels: ['Doanh thu'],
            barColors: ['#34A8DB'],
            hideHover: true,
            resize: true
        });

      Morris.Bar({
            element: 'morris-bar2',
            data: chart_data_quantity,
            xkey: 'y',
            ykeys: ['a'],
            labels: ['Số lượng'],
            barColors: ['#2BCBB9'],
            hideHover: true,
            resize: true
        });


      // end write the chart
     

      request.fail(function(jqXHR, textStatus){
        hide_loading_message();
        show_message('Add request failed : ' + textStatus, 'error');
      });





    });

  }
});


});