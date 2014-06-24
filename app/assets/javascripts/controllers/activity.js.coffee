App.ActivityController = Ember.ObjectController.extend
        actions:
                isCompleted: ->
                        activity = this.get('model')
                        activity.incrementProperty('count')
                        console.log(activity.save())
               
