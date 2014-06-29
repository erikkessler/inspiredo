App.Contract = DS.Model.extend
        name: DS.attr('string')
        reward: DS.attr('string')
        count: DS.attr('number')
        needed: DS.attr('number')
        user_id: DS.belongsTo('student')
        activity_ids: DS.hasMany('activity')
        total: ( ->
                total = 0
                this.get('activity_ids').forEach (act) ->
                        total = (act.get('count') * act.get('value'))
                return total
                ).property('activity_ids.@each.count')
        left: ( ->
                return this.get('needed') - this.get('total')
                ).property('total')
