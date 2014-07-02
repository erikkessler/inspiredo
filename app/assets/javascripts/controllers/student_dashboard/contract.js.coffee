App.StudentDashboardContractController = Ember.ObjectController.extend
        isActive: ( ->
                return this.get('model.state') == 0
                ).property('model.state')
