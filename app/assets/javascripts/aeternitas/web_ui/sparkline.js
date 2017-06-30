$(document).ready(function() {
    $(".sparkline").each(function(i,sparkline){
        console.log(sparkline)
        var data = $(sparkline).html().split(",");
        var labels = Array.from(Array(data.length).keys());
        var container = $("<canvas class='sparkline-container'></canvas>");
        $(sparkline).html(container);

        new Chart(container.get(0), {
            type: 'line',
            data: {
               labels: labels,
               datasets: [{
                   data: data,
                   pointRadius: 0,
                   lineTension: 0,
                   borderColor: '#96C0CE',
                   backgroundColor: 'rgba(171,221,235,0.5)'
               }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    yAxes: [{display: false, ticks: {min: 0}}],
                    xAxes: [{display: false}]
                },
                legend: {
                    display: false
                }
            }
        })
    })
});