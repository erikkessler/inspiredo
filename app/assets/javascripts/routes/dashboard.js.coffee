App.DashboardRoute = Ember.Route.extend
        model: ->
                return this.store.find('student')

stus = [
        {
                id: 1,
                name: 'Cam Kessler'
        }
        {
                id: 2,
                name: 'Ronnie Eastman'
        }
        {
                id: 3,
                name: 'Nick Brindisi'
        }
]

