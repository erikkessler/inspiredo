App.StudentDashboardController = Ember.ArrayController.extend
        needs: ["sign_in"]

        sortAscending: true
        sortProperties: [ 'needed' ]

        active: ( ->
                this.get('arrangedContent').filterBy('state', 0)
                ).property(true)

        inactive: ( ->
                this.get('arrangedContent').filterBy('state', 1)
                ).property(true)
        
