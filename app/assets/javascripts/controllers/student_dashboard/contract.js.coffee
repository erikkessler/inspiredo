App.StudentDashboardContractController = Ember.ObjectController.extend
        isActive: ( ->
                return this.get('model.state') == 0
                ).property('model.state')

        completed: ( ->

                return this.get('model.activity_ids').filterBy('complete_today', true)
                ).property('model.activity_ids.@each.complete_today')

        incompleted: ( ->
                return this.get('model.activity_ids').filterBy('complete_today', false)
                ).property('model.activity_ids.@each.complete_today')
