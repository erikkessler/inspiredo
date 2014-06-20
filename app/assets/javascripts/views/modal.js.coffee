App.ModalView = Ember.View.extend
        layout: Ember.Handlebars.compile("{{yield}}<div class=modal-backdrop></div>")

        didInsertElement:  ->
                App.animateModalOpen()
                
                $('body').on('keyup.modal', ( (event) ->
                        if event.keyCode == 27
                                this.get('controller').send('close')
                ).bind(this))

                this.$('input[type=text]').first().focus()

        willDestroyElement: ->
                $('body').off('keyup.modal')


App.CogsModalView = App.ModalView.extend
App.ConfirmDeleteView = App.ModalView.extend
App.WidgetsModalView = App.ModalView.extend
