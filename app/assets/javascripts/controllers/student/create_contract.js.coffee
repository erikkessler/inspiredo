App.StudentCreateContractController = Ember.Controller.extend

        actions:
                create: ->
                        alert("create contract" + this.get('name'))

                cancel: ->
                        this.transitionToRoute('student', this.get('model'))
