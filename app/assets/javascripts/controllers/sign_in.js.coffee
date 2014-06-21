App.SignInController = Ember.Controller.extend
        email: (->
                if this.get('token')
                        self = this
                        request = Ember.$.ajax('/api/v1/accounts/info', {
                                "beforeSend": (xhr) ->
                                                xhr.setRequestHeader('Authorization', 'Token token=' + self.get('token'))
                                "type":'GET'
                                "dataType": 'JSON'})
                                .then (response) ->
                                        self.set('email', response.email)
                                        self.set('is_mentor', response.is_mentor)
                                        self.set('is_student', response.is_student)
                                        return response.email
                                        
                else
                        self.set('email', undefined)
                        self.set('is_mentor', undefined)
                        self.set('is_student', undefined)
                        return undefined
                
                ).property('token')

        token: (->
                if localStorage.token
                                this.set('remember', true)
                                this.set('token', localStorage.token)
                                return localStorage.token
                                
                        else
                                this.set('remember', false)
                                this.set('token', sessionStorage.token)
                                return sessionStorage.token
                ).property(true)
        
        
        tokenChanged:( ->
                if this.get('remember')
                        sessionStorage.removeItem('token')
                        localStorage.token = this.get('token')
                else
                        localStorage.removeItem('token')
                        sessionStorage.token = this.get('token')
                ).observes('token')
        actions:
                                
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
                                                
