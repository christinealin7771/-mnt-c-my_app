var button = document.getElementById('my-button');
var timerSpan = document.getElementById('timer');
var startTime = Date.parse(timerSpan.innerText);
var remainingTime=startTime;
var myTimer = -1;

function toggleTimer()
{
    if (myTimer == -1)
    {
        button.innerHTML = "Pause";
        if(typeof localStorage.getItem("remainingTime") !== 'undefined' && typeof localStorage.getItem("remainingTime") !== null)
        {
            remainingTime = localStorage.getItem("remainingTime");
        }
        myTimer = setInterval(function ()
        {
            var hours = Math.floor((remainingTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);
            document.getElementById("display").innerHTML = hours + "h "
                + minutes + "m " + seconds + "s ";

            remainingTime-=1000;

            if (hours ==0 && minutes==0 && seconds==0)
            {
                clearInterval(myTimer);
                reset();
                toggleTimer();
                alert("Timer finished");
            }
            localStorage.setItem("remainingTime", remainingTime);
        }, 1000);
    }
    else if (myTimer!=-1)
    {
        button.innerHTML = "Start";
        clearInterval(myTimer);
        myTimer = -1;
    }
}

function reset()
{
    localStorage.clear();
    remainingTime = startTime;
    var hours = Math.floor((remainingTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);
    document.getElementById("display").innerHTML = hours + "h "
        + minutes + "m " + seconds + "s ";
}
