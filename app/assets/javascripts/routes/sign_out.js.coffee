App.SignOutRoute = Ember.Route.extend
        beforeModel: ->
                localStorage.removeItem('token')
                sessionStorage.removeItem('token')
                this.transitionTo('/')

                
