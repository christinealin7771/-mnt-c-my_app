function toggleTimer() {
    let timerSpan= document.getElementById('timer').getTime();

    setInterval(function()
    {
        var hours = Math.floor(( timerSpan% (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((timerSpan % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((timerSpan % (1000 * 60)) / 1000);

        document.getElementById("demo").innerHTML=hours + "h "
            + minutes + "m " + seconds + "s ";

        if(timerSpan <0)
        {
            clearInterval(timerSpan=0);
        }
    }, 1000)
}