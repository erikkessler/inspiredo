App.AddItemComponent = Ember.Component.extend
        tagName: 'li'
        classNames: ['add']
        classNameBindings: ['classType']
        classType: ( ->
                return this.get('addType')
                ).property('addType')
