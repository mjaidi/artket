(function($) {
    $.fn.percentPie = function(options) {

        var settings = $.extend({
            width: 100,
            trackColor: "EEEEEE",
            barColor: "d8c6aa",
            barWeight: 30,
            startPercent: 0,
            endPercent: 1,
            fps: 60
        }, options);

        this.css({
            width: settings.width,
            height: settings.width
        });

        var that = this,
            hoverPolice = false,
            canvasWidth = settings.width,
            canvasHeight = canvasWidth,
            id = $('canvas').length,
            canvasElement = $('<canvas id="' + id + '" width="' + canvasWidth + '" height="' + canvasHeight + '"></canvas>'),
            canvas = canvasElement.get(0).getContext("2d"),
            centerX = canvasWidth / 2,
            centerY = canvasHeight / 2,
            radius = settings.width / 2 - settings.barWeight / 2;
        counterClockwise = false,
            fps = 1000 / settings.fps,
            update = .01;
        this.angle = settings.startPercent;

        this.drawArc = function(startAngle, percentFilled, color) {
            var drawingArc = true;

            canvas.beginPath();
            canvas.arc(centerX, centerY, radius, (Math.PI / 180) * (startAngle * 360 - 90), (Math.PI / 180) * (percentFilled * 360 - 90), counterClockwise);
            canvas.strokeStyle = color;
            canvas.lineWidth = settings.barWeight;
            canvas.stroke();
            drawingArc = false;
        }

        this.fillChart = function(stop) {
            var loop = setInterval(function() {
                hoverPolice = true;
                canvas.clearRect(0, 0, canvasWidth, canvasHeight);

                var grad = canvas.createRadialGradient(238, 50, 10, 238, 50, 300);
                grad.addColorStop(1, "#F9D0A8");
                grad.addColorStop(0.6, "#F26A9B");
                grad.addColorStop(0.4, "#F99028");
                grad.addColorStop(0.3, "#F9D0A8");

                settings.barColor = grad;

                that.drawArc(0, 360, settings.trackColor);
                that.angle += update;
                that.drawArc(settings.startPercent, that.angle, settings.barColor);

                if (that.angle > stop) {
                    clearInterval(loop);
                    hoverPolice = false;
                }
            }, fps);
        }

        this.mouseover(function() {
            if (hoverPolice == false) {
                that.angle = settings.startPercent;
                that.fillChart(settings.endPercent);
            }
        });

        this.fillChart(settings.endPercent);
        this.append(canvasElement);
        return this;
    }
}(jQuery));

$(document).ready(function() {

    $('.likes').percentPie({
        width: 200,
        trackColor: "white",
        barColor: "#F9F60D",
        barWeight: 25,
        endPercent: 1,
        fps: 60
    });

    $('.views').percentPie({
        width: 200,
        trackColor: "white",
        barColor: "#EF1B09",
        barWeight: 25,
        endPercent: 1,
        fps: 60
    });


    $('.artworks').percentPie({
        width: 200,
        trackColor: "white",
        barColor: "#F39C12",
        barWeight: 25,
        endPercent: 1,
        fps: 60
    });

    $('.exhibitions').percentPie({
        width: 200,
        trackColor: "white",
        barColor: "#884EA0",
        barWeight: 25,
        endPercent: 1,
        fps: 60
    });

});
