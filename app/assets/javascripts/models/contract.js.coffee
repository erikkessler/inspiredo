App.Contract = DS.Model.extend
        name: DS.attr('string')
        reward: DS.attr('string')
        count: DS.attr('number')
        needed: DS.attr('number')
        user_id: DS.belongsTo('student')
        activity_ids: DS.hasMany('activity')
