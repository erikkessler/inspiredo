App.DashboardStudentRoute = Ember.Route.extend
        actions:
                createActivity: (fields, cId) ->
                        self = this
                        contract = this.store.getById("contract", cId)
                        fields["contract"] = contract
                        console.log(fields)
                        activity = this.store.createRecord 'activity', fields
                        activity.save().then( ->
                        
                                )