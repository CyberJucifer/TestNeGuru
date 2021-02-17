document.addEventListener('turbolinks:load', function() {
    let control = document.querySelector('.rule')

    if (control) {
        $('select').change(controlParameter)
    }
})

    function controlParameter() {
        let parameterCategories = document.querySelector('.parameter-categories').classList
        let parameterLevels = document.querySelector('.parameter-levels').classList

        if ($(this).val() === 'all_tests_exact_category') {
            parameterCategories.remove('hide')
            parameterLevels.add('hide')
            document.querySelector('.parameter-levels select').setAttribute('disabled','true')
        } else if ($(this).val() === 'first_try') {
            parameterCategories.add('hide')
            parameterLevels.add('hide')
            document.querySelector('.parameter-levels select').setAttribute('disabled','true')
        } else if ($(this).val() === 'all_tests_exact_level') {
            parameterCategories.add('hide')
            parameterLevels.remove('hide')
            document.querySelector('.parameter-levels select').removeAttribute('disabled')
        }
    }
