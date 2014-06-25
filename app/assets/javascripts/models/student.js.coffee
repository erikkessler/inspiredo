App.Student = DS.Model.extend
        email: DS.attr('string')
        contracts: DS.hasMany('contract')
