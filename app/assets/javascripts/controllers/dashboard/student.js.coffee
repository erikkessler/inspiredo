App.DashboardStudentController = Ember.Controller.extend

        actions:

                delete: (con) ->
                        con.destroyRecord()
                        
                createActivity: (fields) ->
                        this.store.createRecord("activity", fields).save()

                deleteAct: (act) ->
                        act.destroyRecord()

                edit: (con) ->
                        con.set("isEditing", true)

                cancel: (con) ->
                        con.set("isEditing", false)
                        con.rollback()

                save: (con) ->
                        con.set("isEditing", false)
                        con.save()
