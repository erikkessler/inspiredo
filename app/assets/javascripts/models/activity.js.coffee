App.Activity = DS.Model.extend
        name: DS.attr('string')
        count: DS.attr('number', {defaultValue: 0})
        value: DS.attr('number')
        days_active: DS.attr('number', { defaultValue: 1 } )
        complete_today: DS.attr('boolean', { defaultValue: false} )
        state: DS.attr('number', { defaultValue: 0 })
        contract_id: DS.belongsTo('contract')
        
