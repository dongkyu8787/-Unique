/*$(function() {
	$("#statistics").click(function() {
		var url = "statistics.do";
		var code = $("#kind option:checkbox").val();
		
        $.ajax({
        	type:"POST",
        	url:"statistics.jsp",
        	dataType:"gson",
        	success:function(data){
        		var obj = GSON.parse(data);
        	}
        })		
	})
	
})*/
$("#search_button").click(function(){
	const radio_val = $('input[name="a"]:checked').val();
	const date = $('#search_days').val();
	
	$.ajax({
		url : "statistics.do",
		type : "post",
		data : "command=graph&letter="+radio_val+"&date="+date
	}).done(function(obj){
		var obj_string = obj.split("_");
		
		var obj_label = obj_string[0];
		var obj_labels = obj_label.split("/");
		
		var obj_value = obj_string[1];
		var obj_values = obj_value.split("/");
		
		var data = {
				  labels: [ ],
				  series: [
				    {
				      label: '',
				      values: []
				    },]
				};
		
		data.labels = obj_labels;
		data.series[0].values = obj_values;

		var max_value = Math.max.apply(null,obj_values) / 100;
		
				var chartWidth       = 300,
				    barHeight        = 20,
				    groupHeight      = barHeight * data.series.length,
				    gapBetweenGroups = 10,
				    spaceForLabels   = 150,
				    spaceForLegend   = 150;

				// Zip the series data together (first values, second values, etc.)
				var zippedData = [];
				for (var i=0; i<data.labels.length; i++) {
				  for (var j=0; j<data.series.length; j++) {
				    zippedData.push(data.series[j].values[i]);
				  }
				}

				// Color scale
				var color = d3.scale.category20();
				var chartHeight = barHeight * zippedData.length + gapBetweenGroups * data.labels.length;

				var x = d3.scale.linear()
				    .domain([0, max_value * 100])
				    .range([0, chartWidth]);
				
				var y = d3.scale.linear()
				    .range([chartHeight + gapBetweenGroups, 0]);

				var yAxis = d3.svg.axis()
				    .scale(y)
				    .tickFormat('')
				    .tickSize(0)
				    .orient("left");
				
				// Specify the chart area and dimensions
				
				var chart = d3.select(".chart")
				    .attr("width", chartWidth + 25)
				    .attr("height", chartHeight);
				
				// Create bars
				var bar = chart.selectAll("g")
				    .data(zippedData)
				    .enter().append("g")
				    .attr("transform", function(d, i) {
				      return "translate(" +25+"," + (i * barHeight + gapBetweenGroups * (0.5 + Math.floor(i/data.series.length))) + ")";
				    });

				// Create rectangles of the correct width
				bar.append("rect")
				    .attr("fill", function(d,i) { return color(i % data.series.length); })
				    .attr("class", "bar")
				    .attr("width", x)
				    .attr("height", barHeight - 1);

				// Add text label in bar
				bar.append("text")
				    .attr("x", function(d) { return x(d) - 3; })
				    .attr("y", barHeight / 2)
				    .attr("fill", "red")
				    .attr("dy", ".35em")
				    .text(function(d) { return d; });

				// Draw labels
				bar.append("text")
				    .attr("class", "label")
				    .attr("x", function(d) { return - 10; })
				    .attr("y", groupHeight / 2)
				    .attr("dy", ".35em")
				    .text(function(d,i) {
				      if (i % data.series.length === 0)
				        return data.labels[Math.floor(i/data.series.length)];
				      else
				        return ""});

				chart.append("g")
				      .attr("class", "y axis")
				      .attr("transform", "translate(" + 25 + ", " + -gapBetweenGroups/2 + ")")
				      .call(yAxis);

	}).fail(function(){
		alert("통신ㅅ ㅣㄹ패");
	});
	
})

