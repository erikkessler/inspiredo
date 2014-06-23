App.ContractView = Ember.View.extend
        tagName: 'li'
        classNames: ['contract']
        templateName: 'contract'
        classNameBindings: ['isExpanded:expanded:collapsed']
        isExpanded: false
        click: (e) ->
                if $(e.target).hasClass('contract') || $(e.target).hasClass('contract-name')
                        this.toggleProperty('isExpanded')
