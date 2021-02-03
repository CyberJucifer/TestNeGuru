document.addEventListener('turbolinks:load', function() {
    var control = document.querySelector('.password-confirmation')

    if (control) { control.addEventListener('input', checkPassword) }
})

function checkPassword() {
    var password = document.getElementById('user_password')
    var passwordConfirmation= document.getElementById('user_password_confirmation')

    var check = document.querySelector('.octicon-check').classList
    var failure = document.querySelector('.octicon-x').classList

    if(passwordConfirmation.value) {
        if (password.value === passwordConfirmation.value) {
            check.remove('hide')
            failure.add('hide')
            passwordConfirmation.classList.remove('check-failure')
            passwordConfirmation.classList.add('check-success')
        } else {
            check.add('hide')
            failure.remove('hide')
            passwordConfirmation.classList.add('check-failure')
            passwordConfirmation.classList.remove('check-success')
        }
    } else {
        passwordConfirmation.classList.remove('check-failure')
        passwordConfirmation.classList.remove('check-success')
        check.add('hide')
        failure.add('hide')
    }


}

