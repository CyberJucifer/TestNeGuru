document.addEventListener('turbolinks:load', function() {
    let timer = document.getElementById("timer")

    if (timer) {
        let timeLeft = timer.dataset.value

        let arr = timeLeft.split(":")
        let h = arr[0]
        let m = arr[1]
        let s = arr[2]

        setInterval( function() {

            if (s == 0) {
                if (m == 0) {
                    if (h == 0) {
                        document.querySelector('form').submit()
                    }
                    h--
                    m = 60
                    if (h < 10) h = "0" + h
                }
                m--
                if (m < 10) m = "0" + m
                s = 59
            } else s--
            if (s < 10) s = "0" + s

            timer.innerHTML = h + ":" + m + ":" + s
        }, 1000)
    }
})
