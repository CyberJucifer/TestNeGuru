class BadgeParameter {
    constructor(form) {
        this.form = form
        this.badge_rule = form.elements.badge_rule
        this.setup()
    }

    reset() {
        this.elements = document.getElementsByClassName('js-parameter')
        this.elements_select = document.getElementsByName('badge[parameter]')

        for (let i = 0; i < this.elements.length; i++) {
            this.elements[i].classList.add('hide')
        }

        for (let i = 0; i < this.elements_select.length; i++) {
            this.elements_select[i].setAttribute('disabled', 'true')
        }
    }

    controlParameter() {
        this.reset()

        this.badge_rule_value = this.badge_rule.options[this.badge_rule.selectedIndex].value
        this.parameter = document.getElementById(this.badge_rule_value)

        if (this.parameter){
            this.parameter.classList.remove('hide')
            this.parameter.classList.remove('js-parameter')
            document.querySelector('.' + this.parameter.className + ' select').removeAttribute('disabled')
            this.parameter.classList.add('js-parameter')
        }
    }

    setup() {
        this.badge_rule.addEventListener('change', event => this.controlParameter())
    }
}

document.addEventListener('turbolinks:load', function() {
    const badge_form = document.getElementById('badge-new')

    if (badge_form) new BadgeParameter(badge_form)
})