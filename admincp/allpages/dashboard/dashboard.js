Colors = {};
Colors.names = {
    black: "#000000",
    blue: "#0000ff",
    brown: "#a52a2a",
    cyan: "#00ffff",
    darkblue: "#00008b",
    darkgrey: "#a9a9a9",
    darkgreen: "#006400",
    darkkhaki: "#bdb76b",
    darkmagenta: "#8b008b",
    darkolivegreen: "#556b2f",
    darkorange: "#ff8c00",
    darkorchid: "#9932cc",
    darkred: "#8b0000",
    darksalmon: "#e9967a",
    darkviolet: "#9400d3",
    fuchsia: "#ff00ff",
    gold: "#ffd700",
    green: "#008000",
    indigo: "#4b0082",
    khaki: "#f0e68c",   
    lime: "#00ff00",
    magenta: "#ff00ff",
    maroon: "#800000",
    navy: "#000080",
    olive: "#808000",
    orange: "#ffa500",
    pink: "#ffc0cb",
    purple: "#800080",
    silver: "#c0c0c0",   
    yellow: "#666600"
};

Colors.random = function() {
    var result;
    var count = 0;
    for (var prop in this.names)
        if (Math.random() < 1/++count)
           result = prop;
    return result;
};

$(document).ready(function(){

// Send company information to database
var request   = $.ajax({
    url: 'allpages/dashboard/data.php',
    type: 'post',
    dataType: 'json',
});

request.done(function(output){

  var rgb = [];

  for(var i = 0; i < output.data.length; i++)


  var chart_data_income = [];  
  var chart_data_quantity = [];         
  
  for(var i = 0; i < output.data.length; i++) {  
      var row = output.data[i];
       
      var obj = {
            label: row.category_name,
            value: row.agent_total_income,              
      };   
      var obj2 = {
            label: row.category_name,
            value: row.agent_total_quantity,              
      }; 

      chart_data_income.push(obj);
      chart_data_quantity.push(obj2);

      tmp_color=Colors.random();
      while(rgb.includes(tmp_color)){
        tmp_color=Colors.random();
      }
      rgb.push(tmp_color);

  }

  console.log(rgb);

  // write the chart
  

  Morris.Donut({
        element: 'morris-color-donut',
        data: chart_data_income,
        colors: rgb,
        resize: true
    });
  Morris.Donut({
        element: 'morris-color-donut2',
        data:chart_data_quantity,
        colors: rgb,
        resize: true
    });


  // end write the chart
  $("div svg text").attr("style", "font-family: Roboto").attr("font-weight", "700");



});

});