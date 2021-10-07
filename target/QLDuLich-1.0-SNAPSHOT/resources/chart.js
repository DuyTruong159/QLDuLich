/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function generateColor() {
    let r = parseInt(Math.random()*255);
    let g = parseInt(Math.random()*255); 
    let b = parseInt(Math.random()*255); 
    return `rgb(${r}, ${g}, ${b})`
}

function generateColorA() {
    let r = parseInt(Math.random()*255);
    let g = parseInt(Math.random()*255); 
    let b = parseInt(Math.random()*255); 
    return `rgba(${r}, ${g}, ${b}, 0.2)`
}

function statsTag(id, statsLabel, statsData) {
    let color = []

    for(let i = 0; i < statsData.length; i++)
    {
        color.push(generateColor())
    }

    const data = {
        labels: statsLabel,
        datasets: [{
            label: 'Thong ke Tour theo danh muc',
            data: statsData,
            backgroundColor: color,
            hoverOffset: 4
        }]
    };

    const config = {
        type: 'doughnut',
        data: data,
    };

    var ctx = document.getElementById(id).getContext('2d');
    var myChart = new Chart(ctx, config);
} 

function statsTour(id, ticketLabel, ticketData) {
    let colora = []

    for(let i = 0; i < ticketLabel.length; i++)
    {
        colora.push(generateColorA())
    }
    
    const labels = ticketLabel;
    const data = {
        labels: labels,
        datasets: [{
            label: 'Ticket',
            data: ticketData,
            backgroundColor: colora,
            borderWidth: 1
        }]
    };
    
    const config = {
        type: 'bar',
        data: data,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }   
        },
    };
    
    var ctx = document.getElementById(id).getContext('2d');
    var myChart = new Chart(ctx, config);
}