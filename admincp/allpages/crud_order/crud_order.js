async function get_district(){
  id_city = $('#id_city').val();
  await $.ajax({
      url: 'allpages/crud_order/get_district.php',
      type: 'post',
      data: {id_city:id_city},
      dataType: 'json',
      success:function(response){
          var len = response.length;
          //destroy select2          
          $("#id_district").select2('destroy'); 
          $("#id_district").empty();

          for( var i = 0; i<len; i++){
              var id_district = response[i]['id_district'];
              var district_name = response[i]['district_name'];
              $("#id_district").append("<option value='"+id_district+"'>"+district_name+"</option>");
          }
          //init select2     
           $('#id_district').select2();
      }
    });
  await console.log('done rewrite district');
  return;
}

async function get_customer_info(){
  id_customer = $('#id_customer').val();
  await $.ajax({
      url: 'allpages/crud_order/get_customer_info.php',
      type: 'post',
      data: {id_customer:id_customer},
      dataType: 'json',
      success:function(response){
        $("#receiver_name").val(response[0]['customer_fullname']);
        $("#receiver_address").val(response[0]['customer_address']);
        $("#receiver_phone").val(response[0]['customer_phone']);
      }
    });
  return;
}

function add_validate_dynamic(){

  var quantity_arr = $('input[name^="quantity"]').each(function() {
    $(this).rules("add", {
        required: true,
        min: 1,
        messages: {
            required: "Vui lòng nhập số lượng !",
            min: "Số lượng nhỏ nhất là 1!"
        }
    });
   
    

  });
  

  var id_product_arr = $('select[name^="id_product["]').each(function() {
      $(this).rules("add", {
          required: true,
          messages: {
              required: "Vui lòng chọn sản phẩm !"
          }
      });
  });
}

$(document).ready(function(){


  // ajax add option to district on id_city change value
  $("#id_city").change(function(){
    get_district();
  });
  // end ajax add option to district

  // ajax add info customer when customer is selected
  $("#id_customer").change(function(){
    var id_customer = $('#id_customer').val();
    if( id_customer != '' ){
      get_customer_info();
    }
  });
  // end ajax add info customer when customer is selected

  // init numberic stepper 
  $(':input[type="number"]').stepper({ limit: [1,] });

  $('#div_products_input').cloneya({serializeIndex: true})
  .on('before_clone.cloneya', function (event, toclone) {
      // do something
       $('select.form-select2').select2('destroy');   
      // console.log('destroy select2');

       // reset form validate, remove unwanted attribute and tag
        // $("#form_company").validate().resetForm();
        // $(":input").removeAttr("aria-describedby");
        // $(":input").removeAttr("aria-invalid");
        // $("em").remove();  
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
      // init Select2    
      $('select.form-select2').select2();
      console.log('init select 2');
     // console.log( $(newclone));
      add_validate_dynamic();
      console.log('try to init validate for new element');

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
    ignore: [],
    rules: {         
      id_customer: {
            required: true,
      },
      receiver_name: {
        required: true,
      },
      receiver_address: {
        required: true,
      },
      receiver_phone: {
        required: true,
      },
      id_district: {
        required: true,
      },
      id_city: {
        required: true,
      },

        },
    messages: {        
      id_customer: {
        required: "Vui lòng chọn khách hàng !",
      }, 
      receiver_name: {
        required: "Vui lòng nhập tên người nhận !",
      }, 
      receiver_phone: {
        required: "Vui lòng nhập số điện thoại người nhận !",
      }, 
      receiver_address: {
        required: "Vui lòng nhập địa chỉ người nhận !",
      }, 
      id_city: {
        required: "Vui lòng chọn thành phố !",
      }, 
      id_district: {
        required: "Vui lòng chọn quận huyện !",
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
  } );


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
    $('#form_company #id_order').val('');    
    $('#id_customer').val('').trigger('change');
    $('#id_agent').val('').trigger('change');

    $('#delivery_status_div').hide();
    $('#delivery_status').val('Chờ giao hàng').trigger('change');

  // remove all product and rewrite it
    $('#div_products_input').children().remove();
  // add 1 select2

    var request = $.ajax({
      url:          'allpages/crud_product/data.php?job=get_companies',
      cache:        false,
      dataType:     'json',
      contentType:  'application/json; charset=utf-8',
      type:         'get'
    });

    request.done(function(output){
    if (output.result == 'success'){

    var products=output.data[0].product_array;
    var product_list=output.data;
    var product_option='';
    for (var i=0;i<product_list.length;i++)
    {
     product_option=product_option+'<option value="'+product_list[i].id_product+'">'+product_list[i].product_name+'</option>' 
    }      
    $("#div_products_input").append('<div class="row toclone" id="row0" >\
        <div class="col-sm-6">\
          <div class="form-group">\
            <select class="form-control form-select2"  name="id_product[0]" >\
              <option value="">Chọn sản phẩm</option>\
               '+product_option+'\
            </select>\
          </div>\
        </div>\
        <div class="col-sm-3">\
          <div class="form-group">\
              <input type="number" class="form-control"  name="quantity[0]" placeholder="số lượng">\
          </div>\
        </div>        \
      <div class="btn btn-success clone"><i class="fas fa-plus"></i></div>\
      <div class="btn btn-danger delete"><i class="fa fa-times"></i></div>\
    </div>');
   
   add_validate_dynamic();

      
    //init select2 for new select         
      $('select.form-select2').select2(); 
    //init number stepper     
        $(':input[type="number"]').stepper({
          limit: [1, ]
        });
    

      }
  });




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
            var receiver_name = $('#receiver_name').val();
            show_message(" Thêm đơn đặt hàng cho khách hành '" + receiver_name + "' thành công!", 'success');
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
      
        $("#id_customer").val(output.data[0].id_customer).trigger('change');
        $("#delivery_status").val(output.data[0].delivery_status).trigger('change');
       

        //handle detail quatation bill

        var products=output.data[0].product_array;
        var product_list=output.data[0].product_list;
        //console.log(product_list);

        var product_option='';
        for (var i=0;i<product_list.id_product.length;i++)
        {
         product_option=product_option+'<option value="'+product_list.id_product[i]+'"> - '+product_list.product_name[i]+'</option>' 
        }
        
        // remove all product and rewrite it
        $('#div_products_input').children().remove();

        for (var i=0;i<products.id_product.length;i++)
        {

          // for each item , add select2 to form
         $("#div_products_input").append('<div class="row toclone" >\
              <div class="col-sm-6">\
                <div class="form-group">\
                  <select class="form-control form-select2" id="id_product'+i+'"  name="id_product['+i+']" >\
                    <option value="">Chọn sản phẩm</option>\
                     '+product_option+'\
                  </select>\
                </div>\
              </div>\
              <div class="col-sm-3">\
                <div class="form-group">\
                    <input type="number" class="form-control" id="quantity'+i+'" name="product[quantity]['+i+']" placeholder="số lượng">\
                </div>\
              </div>        \
            <div class="btn btn-success clone"><i class="fas fa-plus"></i></div>\
            <div class="btn btn-danger delete"><i class="fa fa-times"></i></div>\
          </div>');

        // debug cloneya span unwanted
        // $('#select'+i).next().remove();
        // end debug

        //init select2 for new select         
        $('select.form-select2').select2(); 

        // set value of new select2+quantity
        $('#id_product'+i).val(products.id_product[i]).trigger('change');
        $('#quantity'+i).val(products.quantity[i]);
        // end handle add select2 to form
    

      }

// init numberic stepper 
$(':input[type="number"]').stepper({ limit: [1,] });

     
     // add_validate_dynamic();

        // end handle detail quatation bill
        $('#id_order').val(output.data[0].id_order);
        $('#id_agent').val(output.data[0].id_agent).trigger('change');
        $('#id_city').val(output.data[0].id_city).trigger('change');
        $('#id_district').val(output.data[0].id_district).trigger('change');
        $('#delivery_status').val(output.data[0].delivery_status).trigger('change');
        $('#delivery_status_div').show();


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