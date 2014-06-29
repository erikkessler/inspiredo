App.ActivityController = Ember.ObjectController.extend
        actions:
                isCompleted: ->
                        activity = this.get('model')
                        activity.incrementProperty('count')
                        activity.save().then ->
                               App.FlashQueue.pushFlash('notice', "You earned " + activity.get('value') + " points!")
               
