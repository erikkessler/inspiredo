App.StudentsRoute = Ember.Route.extend
        model: ->
                return this.store.find('student')
