App.ActivityController = Ember.ObjectController.extend
        actions:
                isCompleted: ->
                        activity = this.get('model')
                        activity.incrementProperty('count')
                        activity.set('complete_today', true)
                        self = this
                        activity.save().then ->
                               App.FlashQueue.pushFlash('notice', "You earned " + activity.get('value') + " points!")
                               self.store.createRecord('feed_item', { content: "Completed " + activity.get('name') + " (" + activity.get('value') +
                               " points)" }).save()
               
