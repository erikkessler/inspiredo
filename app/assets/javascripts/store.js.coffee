# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

App.ApplicationStore = DS.Store.extend({

})

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
#App.ApplicationAdapter = DS.ActiveModelAdapter.extend({
#})
#

App.ApplicationAdapter = DS.RESTAdapter.extend
        namespace: 'api/v1'
        headers: ( ->
                return {
        
                        "Authorization": 'Token token=' + this.get('token')

                        }).property(true)

        token:( ->
                if sessionStorage.token
                        return sessionStorage.token
                else
                        return localStorage.token
                        ).property(true)


        
App.StudentSerializer = DS.RESTSerializer.extend

        normalizePayload: (payload, type) ->
                delete payload.mentor_students

                if payload.contracts != undefined
                        for contract in payload.contracts
                                contract.activities = contract.activity_ids
                for student in payload.students
                        student.contracts = student.contract_ids
                
                return payload

App.ActivitySerializer = DS.RESTSerializer.extend

        normalizePayload: (payload, type) ->
                delete payload[1]
                return payload


App.ContractSerializer = DS.RESTSerializer.extend

        normalizePayload: (payload, type) ->
                for contract in payload.contracts
                        contract.student = contract.user_id
                        contract.activities = contract.activity_ids
                delete payload.users
                return payload

        
    
