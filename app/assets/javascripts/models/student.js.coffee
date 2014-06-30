App.Student = DS.Model.extend
        email: DS.attr('string')
        contract_ids: DS.hasMany('contract')
        feed_item_ids: DS.hasMany('feed_item')
