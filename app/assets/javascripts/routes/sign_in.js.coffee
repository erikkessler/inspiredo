App.SignInRoute = Ember.Route.extend
         beforeModel: ->
                this.controllerFor('sign_in').send('getToken')
                if this.controllerFor('sign_in').get('token')
                        this.transitionTo('/dashboard')
