App.Activity = DS.Model.extend
        name: DS.attr('string')
        count: DS.attr('number', {defaultValue: 0})
        value: DS.attr('number')
        contract_id: DS.belongsTo('contract')
