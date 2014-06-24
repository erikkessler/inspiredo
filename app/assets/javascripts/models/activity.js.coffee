App.Activity = DS.Model.extend
        name: DS.attr('string')
        count: DS.attr('number')
        value: DS.attr('number')
        contract: DS.belongsTo('contract')
