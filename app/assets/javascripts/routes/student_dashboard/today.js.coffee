App.StudentDashboardTodayRoute = Ember.Route.extend
        model: ->
                return this.store.find('activity')
