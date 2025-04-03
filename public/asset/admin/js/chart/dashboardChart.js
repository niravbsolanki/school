"use strict";
var DatatablesDataSourceHtml = function () {

    var ChartMaleFemale = function () {

    if ($("#student-doughnut-chart").length) {

      var doughnutChartData = {
        labels: ["Female Students", "Male Students"],
        datasets: [{
          backgroundColor: ["#304ffe", "#ffa601"],
          data: [{!!$student_male!!}, {!!$student_female!!}],
          label: "Total Students"
        }, ]
      };
      var doughnutChartOptions = {
        responsive: true,
        maintainAspectRatio: false,
        cutoutPercentage: 65,
        rotation: -9.4,
        animation: {
          duration: 2000
        },
        legend: {
          display: false
        },
        tooltips: {
          enabled: true
        },
      };
      var studentCanvas = $("#student-doughnut-chart").get(0).getContext("2d");
      var studentChart = new Chart(studentCanvas, {
        type: 'doughnut',
        data: doughnutChartData,
        options: doughnutChartOptions
      });
    }
    };

    return {
        init: function () {
            ChartMaleFemale();
        },

    };

}();

jQuery(document).ready(function () {
    DatatablesDataSourceHtml.init();
});