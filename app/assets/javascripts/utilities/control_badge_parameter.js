document.addEventListener('turbolinks:load', function() {
    const badge_form = document.getElementById('badge-new')

    if (badge_form) new BadgeParameter(badge_form)
})
