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
                return payload

App.ActivitySerializer = DS.RESTSerializer.extend

        normalizePayload: (payload, type) ->
                delete payload.student_activities
                return payload


App.ContractSerializer = DS.RESTSerializer.extend

        normalizePayload: (payload, type) ->
                for contract in payload.contracts
                        contract.student = contract.user_id
                        contract.activities = contract.activity_ids
                delete payload.student_contracts
                return payload

        
    
