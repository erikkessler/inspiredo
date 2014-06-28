App.DashboardStudentCreateContractRoute = Ember.Route.extend
        model: ->
                return this.store.createRecord('contract', { user_id: this.modelFor("dashboard.student") })
