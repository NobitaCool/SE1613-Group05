// Color Variables
const chartOrderStatistics = document.querySelector('#orderStatisticsChart'),
    orderChartConfig = {
      chart: {
        height: 165,
        width: 130,
        type: 'donut'
      },
      labels: ['Electronic', 'Sports', 'Decor', 'Fashion'],
      series: [85, 15, 50, 50],
      colors: [config.colors.primary, config.colors.secondary, config.colors.info, config.colors.success],
      stroke: {
        width: 5,
        colors: cardColor
      },
      dataLabels: {
        enabled: false,
        formatter: function (val, opt) {
          return parseInt(val) + '%';
        }
      },
      legend: {
        show: false
      },
      grid: {
        padding: {
          top: 0,
          bottom: 0,
          right: 15
        }
      },
      plotOptions: {
        pie: {
          donut: {
            size: '75%',
            labels: {
              show: true,
              value: {
                fontSize: '1.5rem',
                fontFamily: 'Public Sans',
                color: headingColor,
                offsetY: -15,
                formatter: function (val) {
                  return parseInt(val) + '%';
                }
              },
              name: {
                offsetY: 20,
                fontFamily: 'Public Sans'
              },
              total: {
                show: true,
                fontSize: '0.8125rem',
                color: axisColor,
                label: 'Weekly',
                formatter: function (w) {
                  return '38%';
                }
              }
            }
          }
        }
      }
    };
  if (typeof chartOrderStatistics !== undefined && chartOrderStatistics !== null) {
    const statisticsChart = new ApexCharts(chartOrderStatistics, orderChartConfig);
    statisticsChart.render();
  }
let cardColor, headingColor, labelColor, borderColor, legendColor;

if (isDarkStyle) {
  cardColor = config.colors_dark.cardColor;
  headingColor = config.colors_dark.headingColor;
  labelColor = config.colors_dark.textMuted;
  legendColor = config.colors_dark.bodyColor;
  borderColor = config.colors_dark.borderColor;
} else {
  cardColor = config.colors.cardColor;
  headingColor = config.colors.headingColor;
  labelColor = config.colors.textMuted;
  legendColor = config.colors.bodyColor;
  borderColor = config.colors.borderColor;
}

const horizontalBarChart = document.getElementById('horizontalBarChart');
if (horizontalBarChart) {
  const horizontalBarChartVar = new Chart(horizontalBarChart, {
    type: 'bar',
    data: {
      labels: ['MON', 'TUE', 'WED ', 'THU', 'FRI', 'SAT', 'SUN'],
      datasets: [
        {
          data: [710, 350, 470, 580, 230, 460, 120],
          backgroundColor: config.colors.info,
          borderColor: 'transparent',
          maxBarThickness: 15
        }
      ]
    },
    options: {
      indexAxis: 'y',
      responsive: true,
      maintainAspectRatio: false,
      animation: {
        duration: 500
      },
      elements: {
        bar: {
          borderRadius: {
            topRight: 15,
            bottomRight: 15
          }
        }
      },
      plugins: {
        tooltip: {
          rtl: isRtl,
          backgroundColor: cardColor,
          titleColor: headingColor,
          bodyColor: legendColor,
          borderWidth: 1,
          borderColor: borderColor
        },
        legend: {
          display: false
        }
      },
      scales: {
        x: {
          min: 0,
          grid: {
            color: borderColor,
            borderColor: borderColor
          },
          ticks: {
            color: labelColor
          }
        },
        y: {
          grid: {
            borderColor: borderColor,
            display: false,
            drawBorder: false
          },
          ticks: {
            color: labelColor
          }
        }
      }
    }
  });
}









const createAdminBtns = document.querySelector('.js-create-admin')
const modalCreate = document.querySelector('.js-modal-create')
const modalCloseAdmin = document.querySelector('.js-modal-close-4')
const modalCancelAdmin = document.querySelector('.js-modal-close-5')



const showModalCreate = () => {
    modalCreate.style.display = "block";
    modalCreate.classList.add('open')
}

const removeModalCreate = () => {
    modalCreate.style.display = "none";
    modalCreate.classList.remove('open')
}

createAdminBtns.addEventListener('click', showModalCreate)

modalCloseAdmin.addEventListener('click', removeModalCreate)

modalCancelAdmin.addEventListener('click', removeModalCreate)



window.onclick = function (event) {

    if (event.target == modalCreate) {
        modalCreate.style.display = "none";
    }
    if (event.target == modalEdit) {
        modalEdit.style.display = "none";
    }
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

