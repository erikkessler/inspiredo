Ember.Handlebars.helper('format-date', (date) ->
        return moment(date).fromNow())
