document.addEventListener('turbolinks:load', progressBarHandler )

function progressBarHandler() {
    let progress = document.querySelector('.progress')

    if (progress) {
        const bar = document.getElementById('progress-bar')
        let questionsCount = progress.dataset.questionsCount
        let completedQuestions = progress.dataset.completedQuestions

        let width = completedQuestions * 100 / questionsCount

        bar.style.width = width + '%'
    }
}
