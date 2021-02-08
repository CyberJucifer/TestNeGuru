document.addEventListener('turbolinks:load', presetTimer)

function presetTimer() {
    let timer = document.getElementById("timer")

    if (timer) {
        let given_value = timer.dataset.value

        if (typeof Cookies.get('currentTime') == "undefined" && typeof countdown == "undefined") {
            countdown = given_value

        } else {
            Cookies.set('currentTime', timer.innerHTML || Cookies.get('currentTime'), {secure: false})
            countdown = Cookies.get('currentTime')
        }
        startTimer(countdown, timer)
    } else {
        Cookies.remove('currentTime')
    }
}

function startTimer(countdown, timer) {
    let result_url = timer.dataset.result
    let arr = countdown.split(":")
    let h = arr[0]
    let m = arr[1]
    let s = arr[2]

    if (s == 0) {
        if (m == 0) {
            if (h == 0) {
                window.location.replace(result_url);
                return
            }
            h--
            m = 60
            if (h < 10) h = "0" + h
        }
        m--
        if (m < 10) m = "0" + m
        s = 59
    }
    else s--
    if (s < 10) s = "0" + s

    timer.innerHTML = h+":"+m+":"+s

    Cookies.set('currentTime', timer.innerHTML, { secure: true })
    setTimeout(presetTimer, 1000)
}
