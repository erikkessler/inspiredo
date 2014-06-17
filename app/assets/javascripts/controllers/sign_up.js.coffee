App.SignUpController = Ember.Controller.extend
        
        actions:
                                
                reset: ->
                        this.setProperties({
                                email: ""
                                password: ""
                                errorMessage: ""
                        })
                sign_up: ->
                        self = this
                        email = this.get('email')
                        password = this.get('password')
                        password_confirmation = this.get('password_confirmation')

                        self.set('errorMessage', null)
                        request = Ember.$.ajax('/api/v1/accounts/sign_up', {
                                "type":'POST'
                                "dataType": 'JSON'
                                "data": { "user": {"email": email, "password": password, "password_confirmation": password_confirmation, "is_mentor": "true", "is_student": "false" }}})
                                .then (response) ->
                                        if( response.status == "success")
                                                self.transitionTo('/sign_in')
                                        else
                                                self.set('errorMessage', response.errors)
                                                
