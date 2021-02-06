document.addEventListener('turbolinks:load', function() {
    $('.form-inline-link').on('click', formInLineLinkHandler)

    var errors = document.querySelector('.resource-errors')

    if (errors) {
        var resourceId = errors.dataset.resourceId
        formInLineHandler(resourceId)
    }
})

function formInLineLinkHandler(event) {
    event.preventDefault()

    var questions = this.dataset.questions
    questions
    formInLineHandler(testId)
}

function formInLineHandler(testId) {
    var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
    var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

    $formInline.toggle()
    $testTitle.toggle()

    if (link) {
        if ($formInline.is(':visible')) {
            link.textContent = 'Cancel'
        } else {
            link.textContent = 'Edit'
        }
    }
}
