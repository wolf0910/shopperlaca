function checkAvailability() {
  $("#loaderIcon").show();
  jQuery.ajax({
  url: "allpages/crud_product/check_availability.php",
  data:'product_name='+$("#product_name").val()+'&id_product='+$("#id_product").val(),
  type: "POST",
  success:function(data){
    $("#user-availability-status").html(data);
    $("#loaderIcon").hide();
  },
  error:function (){}
  });
}

var editor = CKEDITOR.replace( 'product_description', {
     toolbarGroups: [  
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
    { name: 'links' },
    { name: 'insert' },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    '/',
    { name: 'styles' },
    { name: 'colors' },
    { name: 'tools' },
    { name: 'others' }
  ],
          extraPlugins: 'uploadimage',
          enterMode: CKEDITOR.ENTER_BR,
        } );
CKFinder.setupCKEditor( editor );
CKEDITOR.disableAutoInline = true; 

var editor2 = CKEDITOR.replace( 'product_additional_information', {
   toolbarGroups: [
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
    { name: 'links' },
    { name: 'insert' },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    '/',
    { name: 'styles' },
    { name: 'colors' },
    { name: 'tools' },
    { name: 'others' }
  ],
      extraPlugins: 'uploadimage',
      enterMode: CKEDITOR.ENTER_BR,
} );
CKFinder.setupCKEditor( editor2 );
CKEDITOR.disableAutoInline = true; 


$(document).ready(function(){

  // init Select2
  $('select.form-select2').select2(); 

  // validation jquery
   
   $( "#form_company" ).validate( {
    ignore: [],
        rules: {         
          product_name: {
            required: true,
          },        
          product_price: {
            required: true,
            number: true,
            min: 1,           
          },

          product_price_4compare1: {
            required: true,
            number: true,
            min: 1,           
          },
          product_price_4compare2: {
            required: true,
            number: true,
            min: 1,         
          },
          product_price_4compare3: {
            required: true, 
            number: true,
            min: 1,          
          },

          agent_point: {
            required: true, 
            number: true,
            min: 1,          
          },

          customer_point: {
            required: true, 
            number: true,
            min: 1,          
          },

          id_producer: {
            required: true,           
          },

          id_category: {
            required: true,           
          },

          
          

          product_description:{
            ckrequired: true,
            
          },
     
        },
        messages: {        
          product_name: {
            required: "Vui lòng nhập tên sản phẩm !",
          },
          product_price: {
            required: "Vui lòng nhập giá !",
            number : "Vui lòng nhập giá !",
            min: "Giá phải lớn hơn 1 !",
          },

          product_price_4compare1: {
            required: "Vui lòng nhập giá !",
            number : "Vui lòng nhập giá !",
            min: "Giá phải lớn hơn 1 !",
          },
          product_price_4compare2: {
            required: "Vui lòng nhập giá !",
            number : "Vui lòng nhập giá !",
            min: "Giá phải lớn hơn 1 !",
          },
          product_price_4compare3: {
            required: "Vui lòng nhập giá !",
            number : "Vui lòng nhập giá !",
            min: "Giá phải lớn hơn 1 !",
          },
          product_description: {
            ckrequired: "Vui lòng nhập mô tả !",           
          },
          id_producer: {
            required: "Vui lòng chọn nhà sản xuất !",
          },
          img_avatar: {
            required: "Vui lòng chọn ảnh đại diện cho sản phẩm !",
          },
          id_category: {
            required: "Vui lòng nhập danh mục sản phẩm !",
          },
          agent_point: {
            required: "Vui lòng nhập điểm thưởng cho đại lý !",
          },
          customer_point: {
            required: "Vui lòng nhập điểm thưởng cho khách hàng !",
          },

        },
        errorElement: "em",
        errorPlacement: function ( error, element ) {
          // Add the `help-block` class to the error element
          error.addClass( "help-block" );

          if (element.attr("name") == "product_description") 
          {
          error.insertBefore("textarea#product_description");
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
    "ajax": "allpages/crud_product/data.php?job=get_companies",
    "columns": [
      { "data": "id_product"},
      { "data": "link_avatar"},
      { "data": "product_name"},
      { "data": "category_name"},
      { "data": "product_price"},
      { "data": "functions",      "sClass": "functions" }
    ],    
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [-1] }
    ],
    "autoWidth": false,
    "order": [[ 0, "desc" ]],
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

    $('.lightbox_content h2').text('Thêm sản phẩm');
    $('#form_company button').text('Thêm sản phẩm');    
    $('#form_company').attr('class', 'form add');
    $('#form_company').attr('data-id', '');
    $('#form_company .field_container label.error').hide();
    $('#form_company .field_container').removeClass('valid').removeClass('error');

    $('#form_company #product_name').val('');
    $('#form_company #img_avatar').val('');
    $('#form_company #img_detail').val('');
    $('#uploaded_img_avatar').html('');
    $('#uploaded_img_details').html('');   
    $('#form_company #id_product').val('');
    $('#product_price').val('');
    $('#form_company #product_price_4compare1').val('');
    $('#form_company #product_price_4compare2').val('');
    $('#form_company #product_price_4compare3').val('');
    $('#form_company #customer_point').val('');
    $('#form_company #agent_point').val('');

    $('#id_category').val('').trigger('change');
    $('#id_producer').val('').trigger('change');
    
    $("#img_avatar").prop('required',true);

    CKEDITOR.instances['product_description'].setData('');
    CKEDITOR.instances['product_additional_information'].setData('');

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
        url:          'allpages/crud_product/data.php?job=add_company',
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
            var product_name = $('#product_name').val();
            show_message(" Thêm tài khoản '" + product_name + "' thành công.", 'success');
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
      url:          'allpages/crud_product/data.php?job=get_company',
      cache:        false,
      data:         'id=' + id,
      dataType:     'json',
      contentType:  'application/json; charset=utf-8',
      type:         'get'
    });
    request.done(function(output){
      if (output.result == 'success'){

        $('.lightbox_content h2').text('Cập nhật sản phẩm');
        $('#form_company button').text('Cập nhật sản phẩm');
        $('#form_company').attr('class', 'form edit');
        $('#form_company').attr('data-id', id);
        $('#form_company .field_container label.error').hide();
        $('#form_company .field_container').removeClass('valid').removeClass('error');
        $('#form_company #product_name').val(output.data[0].product_name);
        $('#form_company #product_price').val(output.data[0].product_price);

        $('#form_company #product_price_4compare1').val(output.data[0].product_price_4compare1);
        $('#form_company #product_price_4compare2').val(output.data[0].product_price_4compare2);
        $('#form_company #product_price_4compare3').val(output.data[0].product_price_4compare3);

        $('#form_company #customer_point').val(output.data[0].customer_point);
        $('#form_company #agent_point').val(output.data[0].agent_point);

        $("#img_avatar").prop('required',false);

        $('#id_category').val(output.data[0].id_category).trigger('change');
        $('#id_producer').val(output.data[0].id_producer).trigger('change');    

       
        $('#uploaded_img_avatar').html(output.data[0].link_avatar);
        $('#uploaded_img_details').html(output.data[0].link_all_img_detail);
        $('#form_company #id_product').val(output.data[0].id_product);
  
        CKEDITOR.instances['product_description'].setData(output.data[0].product_description);
        CKEDITOR.instances['product_additional_information'].setData(output.data[0].product_additional_information);
        

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
        url:          'allpages/crud_product/data.php?job=edit_company&id=' + id,
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
            var product_name = $('#product_name').val();
            show_message("Cập nhật sản phẩm '" + product_name + "' thành công.", 'success');
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
    var product_name = $(this).data('name');
    if (confirm("Bạn có chắc muốn xóa tài khoản '" + product_name + "'?")){
      show_loading_message();
      var id      = $(this).data('id');
      var request = $.ajax({
        url:          'allpages/crud_product/data.php?job=delete_company&id=' + id,
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
            show_message(" Xóa tài khoản '" + product_name + "' thành công.", 'success');
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