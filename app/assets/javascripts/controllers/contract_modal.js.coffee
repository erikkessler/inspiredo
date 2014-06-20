App.ContractModalController = Ember.Controller.extend
        create: ->
                contract = this.store.createRecord()

                widget.on 'didCreate', this, ->
                      this.send('close')

                this.set('modal', contract)
