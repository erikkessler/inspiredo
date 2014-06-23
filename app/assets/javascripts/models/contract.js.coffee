App.Contract = DS.Model.extend
        name: DS.attr('string')
        reward: DS.attr('string')
        student: DS.belongsTo('student')
        activities: DS.hasMany('activity')
