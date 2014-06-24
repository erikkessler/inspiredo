App.Contract = DS.Model.extend
        name: DS.attr('string')
        reward: DS.attr('string')
        count: DS.attr('number')
        needed: DS.attr('number')
        student: DS.belongsTo('student')
        activities: DS.hasMany('activity')
