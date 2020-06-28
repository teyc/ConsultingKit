

function updateDate(delay, animateDuration) {
    var value = Date().toString().replace('(', '\n(');
    var dateElement = document.getElementById("date");
    if (delay && animateDuration) {
        setTimeout(function () {
            var ms = animateDuration / value.length;
            for (var i = 0; i < value.length; i++) {
                setTimeout(function (x) {
                    dateElement.value = value.substring(0, x + 1);
                }, i * ms, i);
            }
            setTimeout(function () {
                setInterval(updateDate, 1000);
            }, animateDuration);
        }, delay);
    } else {
        dateElement.value = value;
    }
}


/* View in fullscreen */
function openFullscreen(elem) {
    if (elem.requestFullscreen) {
        return elem.requestFullscreen();
    } else if (elem.mozRequestFullScreen) { /* Firefox */
        return elem.mozRequestFullScreen();
    } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
        return elem.webkitRequestFullscreen();
    } else if (elem.msRequestFullscreen) { /* IE/Edge */
        return elem.msRequestFullscreen();
    }
}