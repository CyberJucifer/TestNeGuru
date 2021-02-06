document.addEventListener('turbolinks:load', function() {
    $(window).on('load', progressBarHandler)
})

function progressBarHandler() {

    progress = document.querySelector('.progress')

    if (progress) {

        var questionsCount = progress.dataset.questionsCount
        var completedQuestions = progress.dataset.completedQuestions

        var width = completedQuestions*100/questionsCount

        var bar = document.getElementById('progress-bar')
        bar.style.width = width + '%'
    }
}
