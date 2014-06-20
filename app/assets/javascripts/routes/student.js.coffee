App.StudentRoute = Ember.Route.extend
        actions:
                create: ->
                        this.send('openModal', 'contract_modal')
                
        
