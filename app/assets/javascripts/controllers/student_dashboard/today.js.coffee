App.StudentDashboardTodayController = Ember.ArrayController.extend
        activities: ( ->
                return this.get('model').filterBy('state', 0)
                ).property('model.@each.complete_today')

        complete: ( ->
                return this.get('activities').filterBy('complete_today', true)
                ).property('activities')

        incomplete: ( ->
                return this.get('activities').filterBy('complete_today', false)
                ).property('activities')

        
