App.StudentRoute = Ember.Route.extend
        actions:
                createActivity: (fields, cId) ->
                        console.log(fields)
                        activity = this.store.createRecord 'activity', fields
                        activity.rollback()
                        console.log(this.store.getById("contract",cId))
