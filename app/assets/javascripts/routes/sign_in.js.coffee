App.SignInRoute = Ember.Route.extend
        beforeModel: ->
                if this.controllerFor('sign_in').get('token')
                        this.transitionTo('/dashboard')
