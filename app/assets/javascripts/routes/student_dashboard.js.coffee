App.StudentDashboardRoute = Ember.Route.extend
        beforeModel: ->

                if !this.controllerFor('sign_in').get('token')
                    this.transitionTo('/sign_in')

                else if this.controllerFor('sign_in').get('email') instanceof Object
                        self = this
                        this.controllerFor('sign_in').get('email').then( ->
                                if self.controllerFor('sign_in').get('is_mentor')
                                        self.transitionTo('/dashboard'))
                else
                        if this.controllerFor('sign_in').get('is_mentor')
                                        this.transitionTo('/dashboard')
        model: ->
                return this.store.find('contract')
