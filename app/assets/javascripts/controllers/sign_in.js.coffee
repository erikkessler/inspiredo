App.SignInController = Ember.Controller.extend
        actions:
                login: ->
                        email = this.get('email')
                        password = this.get('password')
                        Ember.$.ajax('/api/v1/accounts/sign_in', {
                                "type":'POST'
                                "dataType": 'JSON'
                                "data": { "email": email, "password": password }})
                                .then (response)->
                                        alert(response.token)
