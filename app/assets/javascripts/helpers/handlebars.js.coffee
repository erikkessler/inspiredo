Ember.Handlebars.helper('format-date', (date) ->
        return moment(date).fromNow())

Ember.Handlebars.helper('capitalize', (string) ->
        return string.charAt(0).toUpperCase() + string.slice(1))
