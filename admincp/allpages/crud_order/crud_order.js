function checkAvailability() {
  $("#loaderIcon").show();
  jQuery.ajax({
  url: "allpages/crud_order/check_availability.php",
  data:'email='+$("#email").val()+'&id_order='+$("#id_order").val(),
  type: "POST",
  success:function(data){
    $("#user-availability-status").html(data);
    $("#loaderIcon").hide();
  },
  error:function (){}
  });
}

function add_validate_dynamic(){

  var product_quality = $('input[name^="product[quantity"]').each(function() {
    $(this).rules("add", {
        required: true,
        min: 1,
        messages: {
            required: "Vui lòng nhập số lượng !",
            min: "Số lượng nhỏ nhất là 1!"
        }
    });
  });

  var product_quality = $('select[name^="product[name"]').each(function() {
      $(this).rules("add", {
          required: true,
          messages: {
              required: "Vui lòng Chọn sản phẩm !"
          }
      });
  });
}

$(document).ready(function(){

  // init numberic stepper
 
  $(':input[type="number"]').stepper({ limit: [1,] });

  $('#animate-clone').cloneya()
  .on('before_clone.cloneya', function (event, toclone) {
      // do something
  })
  .on('after_clone.cloneya', function (event, toclone, newclone) {
      // do something   
  })
  .on('before_append.cloneya', function (event, toclone, newclone) {
      $(newclone).css('display', 'none');
      $(toclone).fadeOut('fast', function () {
          $(this).fadeIn('fast');
      });
  })
  .on('after_append.cloneya', function (event, toclone, newclone) {
      $(newclone).slideToggle();
      console.log('finished cloning ' + toclone.attr('id') + ' to ' + newclone.attr('id'));
  })
  .off('remove.cloneya')
  .on('remove.cloneya', function (event, clone) {
      clone.css('background-color', 'red');

      $(clone).slideToggle('slow', function () {
          $(clone).remove();
      });

  })
  .on('after_delete.cloneya', function () {
      console.log('deleted');
  });


  
  // init Select2
  $('select.form-select2').select2(); 

  // test validation jquery
  $( "#form_company" ).validate( {
    
    rules: {         
      id_customer: {
            required: true,
          },
          id_user: {
            required: true,
          },
        },
    messages: {        
          id_customer: {
            required: "Vui lòng chọn khách hàng !",
          }, 
          id_user: {
            required: "Vui lòng chọn nhân viên !",
          },       
        },
          
        errorElement: "em",
        errorPlacement: function ( error, element ) {
        // Add the `help-block` class to the error element
        error.addClass( "help-block" );

        if ( element.prop( "name" ) == "id_customer" ) 
          {
            error.insertAfter( element.parent().parent() );
          } 
          else if ( element.prop( "name" ) == "id_user" ) 
          {
            error.insertAfter( element.parent().parent() );
          }  else
          {
            error.insertAfter( element.parent() );
          }
        },
        highlight: function ( element, errorClass, validClass ) {
          $( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
        },
        unhighlight: function (element, errorClass, validClass) {
          $( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
        }
      } );

    add_validate_dynamic();
    //end test

  // On page load: datatable
  var table_companies = $('#table_companies').DataTable({
    "ajax": "allpages/crud_order/data.php?job=get_companies",
    "columns": [
     
      { "data": "id_order"},
      { "data": "receiver_name"},      
      { "data": "receiver_phone"},
      { "data": "receiver_address"},      
      { "data": "date_created"},  
      { "data": "delivery_status"},    
      { "data": "agent_name"},
      
      
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
    },
    "orderCellsTop": true,
    initComplete: function () {
      AddFilterToHeader();
    }
  });
  function AddFilterToHeader(){
     $(".filterhead").each( function ( i ) {
        var select = $('<select class="table_dropdown_filter"><option value=""></option></select>')
            .appendTo( $(this).empty() )
            .on('change', function () {
               var term = $(this).val();
                table_companies.column( i ).search(term, false, false ).draw();
            } );

        table_companies.column( i ).data().unique().sort().each( function ( d, j ) {
            select.append( '<option value="'+d+'">'+d+'</option>' )
        } );
    });

    $(".filterhead").last().empty();
    $(".filterhead").last().prev().empty();
    $(".filterhead").first().empty();
}
   
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

    // reset form
    $("#form_company").validate().resetForm();
    $(":input").removeAttr("aria-describedby");
    $(":input").removeAttr("aria-invalid");
    $("em").remove();

    $('.lightbox_content h2').text('Thêm đơn đặt hàng');
    $('#button_submit').text('Thêm đơn đặt hàng');    
    $('#form_company').attr('class', 'form add');
    $('#form_company').attr('data-id', '');
    $('#form_company .field_container label.error').hide();
    $('#form_company .field_container').removeClass('valid').removeClass('error');

    $('#form_company #fullname').val('');
    $('#form_company #email').val('');
    $('#form_company #phone').val('');
    $('#form_company #address').val('');
    $('#form_company #password').val('');
    $('#form_company #email').val('');
    $('#form_company #gender').val('');
    $('#form_company #birthday').val('');
    $('#form_company #avatar').val('');
      
    $('#form_company #id_order').val('');
    $('#id_customer').val('').trigger('change');
    $('#id_user').val('').trigger('change');

  // remove all select2
    $('#div_products_input').children().remove();

  // add 1 select2

    show_lightbox();
  });

  // Add company submit form
  $(document).on('submit', '#form_company.add', function(e){
    e.preventDefault();
    // test validation jquery
  $( "#form_company" ).validate( {
    
    rules: {         
      id_customer: {
            required: true,
          },
      id_user: {
            required: true,
          },
        },
    messages: {        
      id_customer: {
            required: "Vui lòng chọn khách hàng !",
          }, 
      id_user: {
            required: "Vui lòng chọn nhân viên !",
          },       
        },
          
        errorElement: "em",
        errorPlacement: function ( error, element ) {
        // Add the `help-block` class to the error element
        error.addClass( "help-block" );

        if ( element.prop( "name" ) == "id_customer" ) 
          {
            error.insertAfter( element.parent().parent() );
          } 
          else if ( element.prop( "name" ) == "id_user" ) 
          {
            error.insertAfter( element.parent().parent() );
          }  else
          {
            error.insertAfter( element.parent() );
          }
        },
        highlight: function ( element, errorClass, validClass ) {
          $( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
        },
        unhighlight: function (element, errorClass, validClass) {
          $( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
        }
      } );

    add_validate_dynamic();
    //end test

    // Validate form
    if (form_company.valid() == true){
      // Send company information to database
      hide_ipad_keyboard();
      hide_lightbox();
      show_loading_message();
      var form_data = $('#form_company').serialize();
      var request   = $.ajax({
        url:          'allpages/crud_order/data.php?job=add_company',
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
          table_companies.ajax.reload(function(){
            hide_loading_message();
            var customer_name = $('#id_customer').find(":selected").data().data.text;
          //  console.log(customer_name);
            show_message(" Thêm đơn đặt hàng cho khách hành '" + customer_name + "' thành công!", 'success');
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
      url:          'allpages/crud_order/data.php?job=get_company',
      cache:        false,
      data:         'id=' + id,
      dataType:     'json',
      contentType:  'application/json; charset=utf-8',
      type:         'get'
    });
    request.done(function(output){
      if (output.result == 'success'){

        $('.lightbox_content h2').text('Cập nhật đơn đặt hàng');
        $('#button_submit').text('Cập nhật đơn đặt hàng');
        $('#form_company').attr('class', 'form edit');
        $('#form_company').attr('data-id', id);
        $('#form_company .field_container label.error').hide();
        $('#form_company .field_container').removeClass('valid').removeClass('error');
      
        $("#id_user").val(output.data[0].created_by_user).trigger('change');

        $("#status").val(output.data[0].status).trigger('change');
        // handle id_customer_personal & id_customer_company
        if( output.data[0].id_customer_personal != "0")
          {
            id_customer='CN'+output.data[0].id_customer_personal;
          }

        if(output.data[0].id_customer_company!="0")
          {
            id_customer='DN'+output.data[0].id_customer_company;
          }

        $("#id_customer").val(id_customer).trigger('change');

        //handle detail quatation bill

        var products=output.data[0].product_array;

        var product_list=output.data[0].product_list;
        //console.log(product_list);

        var product_option='';
        for (var i=0;i<product_list.id_product.length;i++)
        {
         product_option=product_option+'<option value="'+product_list.id_product[i]+'">'+product_list.product_code[i]+' - '+product_list.product_name[i]+'</option>' 
        }
        
        // remove 1st select null
        $('#div_products_input').children().remove();

        for (var i=0;i<products.id_product.length;i++)
        {

          // for each item , add select2 to form
        $("#div_products_input").append('<div class="j-row toclone-widget-right toclone cloneya">\
          <div class="span6 unit" style="width: 40%;">\
          <div class="input"><select id="select'+i+'" class="my_testing_select22 col-sm-12 select2-hidden-accessible" tabindex="-1" aria-hidden="true" name="product[name]['+i+']">\
                        <option value="">Chọn sản phẩm</option>\
            '+product_option+'\
                       </select>\
                       <span class="select2 select2-container select2-container--default" dir="ltr" style="width: 1px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="-1" aria-labelledby="select2-productname-e9-container"><span class="select2-selection__rendered" id="select2-productname-e9-container"><span class="select2-selection__placeholder">Chọn sản phẩm</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>\
                       </div>\
                  </div>\
                      <div class="span6 unit" style="width: 40%;">\
                          <div class="input">\
                              <input id="quantity'+i+'" type="number" name="product[quantity]['+i+']" placeholder="Số lượng" >\
                          </div>\
                      </div>\
              <button type="button" class="btn btn-primary clone-btn-right clone clone_select2">\
              <i class="icofont icofont-plus"></i>\
              </button>\
              <button type="button" class="btn btn-default clone-btn-right delete">\
              <i class="icofont icofont-minus"></i>\
              </button>\
          </div>');

        //debug cloneya span unwanted
        $('#select'+i).next().remove();
        // end debug

        //init select2 for new select
        $('#select'+i).select2({
          dropdownParent: $('.lightbox_container')
        });
        // set value of new select2+quantity
        $('#select'+i).val(products.id_product[i]).trigger('change');
        $('#quantity'+i).val(products.quantity[i]);
          // end handle add select2 to form
    

      }


      // reinit number stepper
      $(':input[type="number"]').stepper({
          limit: [1, ]
        });
      add_validate_dynamic();

        // end handle detail quatation bill
        $('#form_company #id_order').val(output.data[0].id_order);


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
        url:          'allpages/crud_order/data.php?job=edit_company&id=' + id,
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
          table_companies.ajax.reload(function(){
            hide_loading_message();
            var id_order = $('#id_order').val();
            show_message("Cập nhật đơn đặt hàng mã '" + id_order + "' thành công.", 'success');
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
    var id = $(this).data('id');
    if (confirm("Bạn có chắc muốn đơn đặt hàng mã '" + id + "'?")){
      show_loading_message();
      var id      = $(this).data('id');
      var request = $.ajax({
        url:          'allpages/crud_order/data.php?job=delete_company&id=' + id,
        cache:        false,
        dataType:     'json',
        contentType:  'application/json; charset=utf-8',
        type:         'get'
      });
      request.done(function(output){
        if (output.result == 'success'){
          // Reload datable
          table_companies.ajax.reload(function(){
            hide_loading_message();
            show_message(" Xóa đơn đặt hàng mã '" + id + "' thành công.", 'success');
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

   // button print onclick
  $('#button_print_view').on('click', function(e){
    e.preventDefault();    
    var id = $('#form_company').attr('data-id');
    window.open('allpages/crud_order/test_invoice.php?id_bill='+id,'_blank');    
  });
  
  $(document).on('click', '.function_view a', function(e){
    e.preventDefault();    
    var id = $(this).data('id');
    window.open('allpages/crud_order/test_invoice.php?id_bill='+id,'_blank');    
  });

});