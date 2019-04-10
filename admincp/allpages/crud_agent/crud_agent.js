function checkAvailability() {
  $("#loaderIcon").show();
  jQuery.ajax({
  url: "allpages/crud_agent/check_availability.php",
  data:'agent_phone='+$("#agent_phone").val()+'&  ='+$("#id_agent").val(),
  type: "POST",
  success:function(data){
    $("#user-availability-status").html(data);
    $("#loaderIcon").hide();
  },
  error:function (){}
  });
}

async function get_district(){
  id_city = $('#id_city').val();
  await $.ajax({
      url: 'allpages/crud_agent/get_district.php',
      type: 'post',
      data: {id_city:id_city},
      dataType: 'json',
      success:function(response){
          var len = response.length;
          $("#id_district").empty();
          for( var i = 0; i<len; i++){
              var id_district = response[i]['id_district'];
              var district_name = response[i]['district_name'];
              $("#id_district").append("<option value='"+id_district+"'>"+district_name+"</option>");
          }
          
      }
    });
  await console.log('done rewrite district');
  return;
}

$(document).ready(function(){

  // ajax add option to district
  $("#id_city").change(function(){
    get_district();
  });
  // end ajax add option to district
  
  // test validation jquery   
 
   $( "#form_company" ).validate( {
    ignore: [], 
        rules: {         
          agent_name: {
            required: true,
          },
          agent_email: {
            required: true,
          },
          agent_phone: {
            required: true,
          }, 
          agent_address: {
            required: true,
          },   
          id_city: {
            required: true,
          },  
          id_district: {
            required: true,
          },       
          map_latitude: {
            required: true,
          },
          map_longitude: {
            required: true,
          }, 
          /* password, user_image required depend on it addform or update */
          password: {

          }, 
         
        },
        messages: {        
          agent_name: {
            required: "Vui lòng nhập họ tên !",
          },
          agent_email: {
            required: "Vui lòng nhập Email !",
          },   
          agent_phone: {
            required: "Vui lòng nhập số điện thoại !",
          },        
          
          agent_address: {
            required: "Vui lòng nhập địa chỉ",
          },
          id_city: {
            required: "Vui lòng chọn thành phố !",
          },
          id_district: {
            required: "Vui lòng chọn quận huyện !",
          },
          map_latitude: {
            required: "Vui lòng nhập latitude !",
          },
          map_longitude: {
            required: "Vui lòng chọn longitude !",
          },
        
          agent_password: {
            required: "Vui lòng nhập mật khẩu!",
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
      } );

  //end test

  // On page load: datatable
  var table_companies = $('#table_companies').dataTable({
    "ajax": "allpages/crud_agent/data.php?job=get_companies",
    'dom': 'Rlfrtip',
    "columns": [
      { "data": "img_4display"},
      { "data": "agent_name"},
      { "data": "agent_phone"},
      { "data": "district_name"},
      { "data": "agent_address"},
      { "data": "status"},      
      { "data": "functions",      "sClass": "functions" }
    ],    
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [-1] }
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
  form_company.validate();

  // Show message
  function show_message(message_text, message_type){
    $('#message').html('<p>' + message_text + '</p>').attr('class', message_type);
    $('#message_container').show();
    if (typeof timeout_message !== 'undefined'){
      window.clearTimeout(timeout_message);
    }
    timeout_message = setTimeout(function(){
      hide_message();
    }, 8000);
  }
  // Hide message
  function hide_message(){
    $('#message').html('').attr('class', '');
    $('#message_container').hide();
  }

  // Show loading message
  function show_loading_message(){
    $('#loading_container').show();
  }
  // Hide loading message
  function hide_loading_message(){
    $('#loading_container').hide();
  }

  // Show lightbox
  function show_lightbox(){
    $('.lightbox_bg').show();
    $('.lightbox_container').show();
  }
  // Hide lightbox
  function hide_lightbox(){
    $('.lightbox_bg').hide();
    $('.lightbox_container').hide();
  }
  // Lightbox background
  $(document).on('click', '.lightbox_bg', function(){
    hide_lightbox();
  });
  // Lightbox close button
  $(document).on('click', '.lightbox_close', function(){
    hide_lightbox();
  });
  // Escape keyboard key
  $(document).keyup(function(e){
    if (e.keyCode == 27){
      hide_lightbox();
    }
  });
  
  // Hide iPad keyboard
  function hide_ipad_keyboard(){
    document.activeElement.blur();
    $('input').blur();
  }

  // Add company button
  $(document).on('click', '#add_company', function(e){
    e.preventDefault();

    $('.lightbox_content h2').text('Tạo tài khoản');
    $('#form_company button').text('Tạo tài khoản');    
    $('#form_company').attr('class', 'form add');
    $('#form_company').attr('data-id', '');
    $('#form_company .field_container label.error').hide();
    $('#form_company .field_container').removeClass('valid').removeClass('error');       
   
    $("#agent_password").prop('required',true);

    $('#form_company #agent_name').val('');
    $('#form_company #agent_email').val('');
    $('#form_company #agent_password').val('');
    $('#form_company #status').val('');
    $('#form_company #agent_phone').val('');
    $('#form_company #agent_address').val('');
    $('#form_company #id_city').val('');
    $('#form_company #id_district').val('');
    $('#user_uploaded_image').html('');
    $('#map_latitude ').val('');
    $('#map_longitude').val('');
    $('#status').val('active');
    $('#status_div').hide();
    
    
     
    /*
    // reset validation form
    $("#form_company").validate().resetForm();  
    */
    show_lightbox();
  });

  // Add company submit form
  $(document).on('submit', '#form_company.add', function(e){
    e.preventDefault();
    // Validate form
    if (form_company.valid() == true){
      // Send company information to database
      hide_ipad_keyboard();
      hide_lightbox();
      show_loading_message();
      var form_data = $('#form_company').serialize();
      var request   = $.ajax({
        url:          'allpages/crud_agent/data.php?job=add_company',
        cache:        false,
        data:new FormData(this),
        dataType:     'json',
        contentType:  'application/json; charset=utf-8',
        method:'POST',
        contentType:false,
        processData:false,
      });

      request.done(function(output){
        if (output.result == 'success'){
          // Reload datable
          table_companies.api().ajax.reload(function(){
            hide_loading_message();
            var agent_phone = $('#agent_phone').val();
            show_message(" Thêm tài khoản '" + agent_phone + "' thành công.", 'success');
          }, true);
        } else {
          hide_loading_message();
          show_message('Tên tài khoản đã tồn tại', 'error');
        }
      });
      request.fail(function(jqXHR, textStatus){
        hide_loading_message();
        show_message('Add request failed : ' + textStatus, 'error');
      });
    }
  });

   // Edit company button
  $(document).on('click', '.function_edit a', function(e){
    e.preventDefault();
    // Get company information from database
    show_loading_message();
    var id      = $(this).data('id');
    var request = $.ajax({
      url:          'allpages/crud_agent/data.php?job=get_company',
      cache:        false,
      data:         'id=' + id,
      dataType:     'json',
      contentType:  'application/json; charset=utf-8',
      type:         'get'
    });
    request.done(function(output){
      if (output.result == 'success'){

        $('.lightbox_content h2').text('Cập nhật tài khoản');
        $('#form_company button').text('Cập nhật tài khoản');
        $('#form_company').attr('class', 'form edit');
        $('#form_company').attr('data-id', id);
        $('#form_company .field_container label.error').hide();
        $('#form_company .field_container').removeClass('valid').removeClass('error');
      
        $('#form_company #agent_password').prop('required',false);
        $('#status_div').show();

        $('#form_company #agent_name').val(output.data[0].agent_name);
        $('#form_company #agent_email').val(output.data[0].agent_email);
        $('#form_company #agent_password').val('');
        $('#form_company #status').val(output.data[0].status);
        $('#form_company #agent_phone').val(output.data[0].agent_phone);
        $('#form_company #agent_address').val(output.data[0].agent_address);
        $('#form_company #sex').val(output.data[0].sex);
        $('#form_company #map_latitude').val(output.data[0].map_latitude);
        $('#form_company #map_longitude').val(output.data[0].map_longitude);
        
        $('#form_company #agent_avatar').val(output.data[0].agent_avatar);
      
        $('#form_company #id_city').val(output.data[0].id_city);
        
// dumb way to update id_district
        // var id_city = $('#id_city').val();
        // $.ajax({
        //     url: 'allpages/crud_agent/get_district.php',
        //     type: 'post',
        //     data: {id_city:id_city},
        //     dataType: 'json',
        //     success:function(response){
        //         var len = response.length;
        //         $("#id_district").empty();
        //         for( var i = 0; i<len; i++){
        //             var id_district = response[i]['id_district'];
        //             var district_name = response[i]['district_name'];
        //             $("#id_district").append("<option value='"+id_district+"'>"+district_name+"</option>");
        //         }
        //         $('#form_company #id_district').val(output.data[0].id_district);
        //     }
        //   });
// end dumb way to update id_district
// async/await style
        async function update_id_district(){
          await get_district();
          console.log(' change id_district plz');
          $('#form_company #id_district').val(output.data[0].id_district);
        }
         update_id_district();
// async/await style

                
        $('#form_company #id_agent').val(output.data[0].id_agent);
        $('#user_uploaded_image').html('<img src="../'+output.data[0].agent_avatar+'" class="img-thumbnail" width="100" height="100" />');
        
        // reset validation form
        $("#form_company").validate().resetForm();
        
        hide_loading_message();
        show_lightbox();
      } else {
        hide_loading_message();
        show_message('Information request failed ', 'error');

      }
    });
    request.fail(function(jqXHR, textStatus){
      hide_loading_message();
      show_message('Information request failed: ' + textStatus, 'error');
      
    });
  });
  
  // Edit company submit form
  $(document).on('submit', '#form_company.edit', function(e){
    e.preventDefault();
    // Validate form
    if (form_company.valid() == true){
      // Send company information to database
      hide_ipad_keyboard();
      hide_lightbox();
      show_loading_message();
      var id        = $('#form_company').attr('data-id');

      var form_data = $('#form_company').serialize();
      var request   = $.ajax({
        url:          'allpages/crud_agent/data.php?job=edit_company&id=' + id,
        cache:        false,
        data:new FormData(this),
        dataType:     'json',
        contentType:  'application/json; charset=utf-8',
        method:'POST',
        contentType:false,
        processData:false,
      });

      request.done(function(output){
        if (output.result == 'success'){
          // Reload datable
          table_companies.api().ajax.reload(function(){
            hide_loading_message();
            var agent_phone = $('#agent_phone').val();
            show_message("Cập nhật tài khoản '" + agent_phone + "' thành công.", 'success');
          }, true);
        } else {
          hide_loading_message();
          show_message('Edit request failed', 'error');
        }
      });
      request.fail(function(jqXHR, textStatus){
        hide_loading_message();
        show_message('Edit request failed: ' + textStatus, 'error');
      });
    }
  });
  
  // Delete company
  $(document).on('click', '.function_delete a', function(e){
    e.preventDefault();
    var name = $(this).data('name');
    if (confirm("Bạn có chắc muốn xóa tài khoản '" + name + "'?")){
      show_loading_message();
      var id      = $(this).data('id');
      var request = $.ajax({
        url:          'allpages/crud_agent/data.php?job=delete_company&id=' + id,
        cache:        false,
        dataType:     'json',
        contentType:  'application/json; charset=utf-8',
        type:         'get'
      });
      request.done(function(output){
        if (output.result == 'success'){
          // Reload datable
          table_companies.api().ajax.reload(function(){
            hide_loading_message();
            show_message(" Xóa tài khoản '" + name + "' thành công.", 'success');
          }, true);
        } else {
          hide_loading_message();
          show_message('Delete request failed', 'error');
        }
      });
      request.fail(function(jqXHR, textStatus){
        hide_loading_message();
        show_message('Delete request failed: ' + textStatus, 'error');
      });
    }
  });

});