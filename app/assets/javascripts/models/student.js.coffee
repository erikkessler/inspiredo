App.Student = DS.Model.extend
        email: DS.attr('string')
        contract_ids: DS.hasMany('contract')
