App.ActivityItemComponent = Ember.Component.extend
        tagName: 'li'
        classNames: ["activity-item"]
        actions:
                isCompleted: ->
                        this.sendAction('action')

