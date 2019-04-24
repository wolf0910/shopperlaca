function checkAvailability() {
  $("#loaderIcon").show();
  jQuery.ajax({
  url: "allpages/crud_producer/check_availability.php",
  data:'producer_name='+$("#producer_name").val()+'&id_producer='+$("#id_producer").val(),
  type: "POST",
  success:function(data){
    $("#user-availability-status").html(data);
    $("#loaderIcon").hide();
  },
  error:function (){}
  });
}

$(document).ready(function(){
  
  // validation jquery
   
   $( "#form_company" ).validate( {
    ignore: [], 
        rules: {         
          producer_name: {
            required: true,
          },  
                     
        },
        messages: {        
          producer_name: {
            required: "Vui lòng nhập tên nhà sản xuất !",
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
    "ajax": "allpages/crud_producer/data.php?job=get_companies",
    "columns": [
      { "data": "id_producer"},      
      { "data": "producer_name"},      
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

    $('.lightbox_content h2').text('Thêm nhà sản xuất');
    $('#button_submit').text('Thêm nhà sản xuất');    
    $('#form_company').attr('class', 'form add');
    $('#form_company').attr('data-id', '');
    $('#form_company .field_container label.error').hide();
    $('#form_company .field_container').removeClass('valid').removeClass('error');
    $('#form_company #producer_name').val(''); 
    $('#form_company #id_producer').val('');
    $('#form_company #img_avatar').val('');
    $('#uploaded_img_avatar').html('');
    $('#user-availability-status').html('');
    $("#img_avatar").attr("required", true);
    $("#button_submit").prop("disabled", false); 
    $("#form_company").validate().resetForm();

    
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
        url:          'allpages/crud_producer/data.php?job=add_company',
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
            var producer_name = $('#producer_name').val();
            show_message(" Thêm nhà sản xuất '" + producer_name + "' thành công.", 'success');
          }, true);
        } else {
          hide_loading_message();
          show_message('Tên nhà sản xuất đã tồn tại', 'error');
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
      url:          'allpages/crud_producer/data.php?job=get_company',
      cache:        false,
      data:         'id=' + id,
      dataType:     'json',
      contentType:  'application/json; charset=utf-8',
      type:         'get'
    });
    request.done(function(output){
      if (output.result == 'success'){

        $('.lightbox_content h2').text('Cập nhật nhà sản xuất');
        $('#form_company button').text('Cập nhật nhà sản xuất');
        $('#form_company').attr('class', 'form edit');
        $('#form_company').attr('data-id', id);
        $('#form_company .field_container label.error').hide();
        $('#form_company .field_container').removeClass('valid').removeClass('error');

        $('#form_company #producer_name').val(output.data[0].producer_name);   
        $('#form_company #id_producer').val(output.data[0].id_producer);       
        // reset validation form
        $("#form_company").validate().resetForm();
        $("#button_submit").prop("disabled", false); 
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
        url:          'allpages/crud_producer/data.php?job=edit_company&id=' + id,
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
            var producer_name = $('#producer_name').val();
            show_message("Cập nhật nhà sản xuất '" + producer_name + "' thành công.", 'success');
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
    var producer_name = $(this).data('name');
    if (confirm("Bạn có chắc muốn xóa '" + producer_name + "'?")){
      show_loading_message();
      var id      = $(this).data('id');
      var request = $.ajax({
        url:          'allpages/crud_producer/data.php?job=delete_company&id=' + id,
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
            show_message(" Xóa nhà sản xuất '" + producer_name + "' thành công.", 'success');
          }, true);
        } else {
          hide_loading_message();
          show_message(output.message, 'error');
        }
      });
      request.fail(function(jqXHR, textStatus){
        hide_loading_message();
        show_message('Delete request failed: ' + textStatus, 'error');
      });
    }
  });

});