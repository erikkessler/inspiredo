App.DashboardStudentCreateContractController = Ember.Controller.extend
        needs: ["dashboardStudent"]
        actions:
                create: ->
                        self = this
                        this.get("model").save().then ( ->
                                self.get("model.activity_ids").save().then( ->
                                        self.set('name', null)
                                        self.set('reward', null)
                                        self.set('needed', null)
                                        self.transitionToRoute('dashboard.student', self.get('controllers.dashboardStudent.model'))
                                        App.FlashQueue.pushFlash('notice', "Added Contract")
                                        )
                                )

                cancel: ->
                        this.store.deleteRecord(this.get("model"))
                        console.log(this.get('controllers.dashboardStudent'))
                        this.transitionToRoute('dashboard.student', this.get('controllers.dashboardStudent.model'))

                new_field: ->
                        new_act = this.store.createRecord('activity', { contract_id: this.get('model'), name: "bro" })
                        
                        
