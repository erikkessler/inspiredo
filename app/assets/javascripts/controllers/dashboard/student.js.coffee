App.DashboardStudentController = Ember.Controller.extend
        feedItems: ( ->
                return Ember.ArrayProxy.createWithMixins(Ember.SortableMixin, {
                        content: this.get('model.feed_item_ids')
                        sortProperties: ['created_at']
                        sortAscending: false
                        
                        }).slice(0,this.get('numberToShow'))
                ).property('model.@each.feed_item_ids', 'numberToShow')

        numberToShow: 5

        more: ( ->
                return this.get('model.feed_item_ids.length') > this.get('numberToShow')
                ).property('model.feed_item_ids', 'numberToShow')

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

                showMore: ->
                        this.set('numberToShow', this.get('numberToShow') + 5)
