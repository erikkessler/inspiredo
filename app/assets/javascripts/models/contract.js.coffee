App.Contract = DS.Model.extend
        name: DS.attr('string')
        reward: DS.attr('string')
        count: DS.attr('number')
        needed: DS.attr('number')
        state: DS.attr('number', { defaultValue: 0 } )
        days_left: DS.attr('number', { defaultValue: 29 } )
        duration: DS.attr('number', { defaultValue: 30 } )
        user_id: DS.belongsTo('student')
        activity_ids: DS.hasMany('activity')

        elapsed: ( ->
                return this.get('duration') - this.get('days_left')
                ).property('days_left')
        total: ( ->
                total = 0
                this.get('activity_ids').forEach (act) ->
                        total = (act.get('count') * act.get('value'))
                return total
                ).property('activity_ids.@each.count')
        left: ( ->
                return this.get('needed') - this.get('total')
                ).property('total')
