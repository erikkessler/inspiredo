App.SignInRoute = Ember.Route.extend
         beforeModel: ->
                this.controllerFor('sign_in').send('getToken')
                if !this.controllerFor('sign_in').get('token')
                        alert('not signed in' + this.controllerFor('sign_in').get('token'))
                else
                        alert('signed in' + this.controllerFor('sign_in').get('token'))
                        this.transitionTo('/dashboard')
