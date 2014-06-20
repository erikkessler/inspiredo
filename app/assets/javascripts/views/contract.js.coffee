App.ContractView = Ember.View.extend
        tagName: 'li'
        classNames: ['contract']
        templateName: 'contract'
        classNameBindings: ['isExpanded:expanded:collapsed']
        isExpanded: false
        click: ->
                this.toggleProperty('isExpanded')
