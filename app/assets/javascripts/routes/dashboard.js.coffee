App.DashboardRoute = Ember.Route.extend
        model: ->
                return this.store.find('student')
        actions:
                openModal: (modal) ->
                        this.render(modal, {
                                into: 'dashboard',
                                outlet: 'modal'
                        })

                        

                closeModal: ( ->
                        App.animateModalClose().then ->
                                this.render 'empty', {
                                        into: 'dashboard'
                                        outlet: 'modal'
                                        }
                        ).bind(this)

