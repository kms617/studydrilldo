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

$(document).ready(function() {

    // var ongoing_pie_container = document.createElement('div');
    // ongoing_pie_container.setAttribute("id", "ongoing_pie");
    // document.body.appendChild(ongoing_pie_container);
    // debugger


    var ideal_pie_chart = new Highcharts.Chart({
        chart: {
            renderTo: 'ideal_pie',
            plotBackgroundColor: null,
            plotBorderWidth: 0,//null,
            plotShadow: false
        },
        title: {
            text: 'Ideal Allocation'
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
            data: gon.ideal_pie
        }]
    });

    var actual_pie_chart = new Highcharts.Chart({
        chart: {
            renderTo: 'actual_pie',
            plotBackgroundColor: null,
            plotBorderWidth: 0,//null,
            plotShadow: false
        },
        title: {
            text: 'My Allocation'
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
            data: gon.actual_pie
        }]
    });

    var ongoing_pie_chart = new Highcharts.Chart({
        chart: {
            renderTo: 'ongoing_pie',
            plotBackgroundColor: null,
            plotBorderWidth: 0,//null,
            plotShadow: false
        },
        title: {
            text: 'Current Status'
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
            data: gon.ongoing_pie
        }]
    });
});

