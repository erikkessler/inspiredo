App.SignInController = Ember.Controller.extend

        token: this.getToken
        
        
        tokenChanged:( ->
                if this.get('remember')
                        sessionStorage.removeItem('token')
                        localStorage.token = this.get('token')
                else
                        localStorage.removeItem('token')
                        sessionStorage.token = this.get('token')
                ).observes('token')
        actions:

                getToken: ->
                        if localStorage.token
                                this.set('remember', true)
                                this.set('token', localStorage.token)
                                
                        else
                                this.set('remember', false)
                                this.set('token', sessionStorage.token)
                                
                reset: ->
                        this.setProperties({
                                email: ""
                                password: ""
                                errorMessage: ""
                        })
                login: ->
                        self = this
                        email = this.get('email')
                        password = this.get('password')

                        self.set('errorMessage', null)
                        request = Ember.$.ajax('/api/v1/accounts/sign_in', {
                                "type":'POST'
                                "dataType": 'JSON'
                                "data": { "email": email, "password": password }})
                                .then (response) ->
                                        if( response.status == "success")
                                                self.set('token', response.token)
                                                self.transitionToRoute('/dashboard')
                                        else
                                                self.set('errorMessage', "Invalid username/password")
                                                
