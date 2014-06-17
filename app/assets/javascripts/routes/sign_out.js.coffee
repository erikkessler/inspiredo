App.SignOutRoute = Ember.Route.extend
        beforeModel: ->
                console.log('gone')
                localStorage.removeItem('token')
                sessionStorage.removeItem('token')
                this.transitionTo('/')

                
