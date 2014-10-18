// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require highcharts
//= require highcharts/highcharts-more
//= require_tree .

var pieChart = function(selector, name, data) {
    new Highcharts.Chart({
        chart: {
            renderTo: selector,
            plotBackgroundColor: null,
            plotBorderWidth: 0,//null,
            plotShadow: false
        },
        title: {
            text: name
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.y:.0f} minutes</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.y:.0f} minutes',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Time',
            data: data
        }]
    });
}

$(document).ready(function() {

    // var ongoing_pie_container = document.createElement('div');
    // ongoing_pie_container.setAttribute("id", "ongoing_pie");
    // document.body.appendChild(ongoing_pie_container);
    // debugger

    var $idealPie = $('#ideal_pie');
    if ($idealPie.length > 0) {

        pieChart('ideal_pie', 'Ideal Allocation', gon.ideal_pie);
    }


     var $actualPie = $('#actual_pie');
    if ($actualPie.length > 0) {

        pieChart('actual_pie', 'My Allocation', gon.actual_pie);
    }

    var $ongoingPie = $('#ongoing_pie');
    if ($ongoingPie.length > 0) {

        pieChart('ongoing_pie', 'Progress', gon.ongoing_pie);
    }

});

