App.StudentCreateContractController = Ember.Controller.extend

        actions:
                create: ->
                        contract = this.store.createRecord 'contract', { name: this.get('name'), reward: this.get('reward'), student: this.get('model') }
                        studentContracts = this.get('model.contracts')
                        self = this
                        contract.save().then ( ->
                                studentContracts.addObject(contract)
                                self.set('name', null)
                                self.set('reward',null)
                                self.transitionToRoute('student', self.get('model'))
                                App.FlashQueue.pushFlash('notice', "Added Contract")
                                )

                cancel: ->
                        this.transitionToRoute('student', this.get('model'))
