App.DashboardRoute = Ember.Route.extend
        beforeModel: ->
                if !this.controllerFor('sign_in').get('token')
                    this.transitionTo('/sign_in')

                else if this.controllerFor('sign_in').get('email') instanceof Object
                        self = this
                        this.controllerFor('sign_in').get('email').then( ->
                                if self.controllerFor('sign_in').get('is_student')
                                        self.transitionTo('student_dashboard.index'))
                else
                        if this.controllerFor('sign_in').get('is_student')
                                        this.transitionTo('student_dashboard.index')
        model: ->
                return this.store.find('student')

        

                        