App.StudentDashboardProfileController = Ember.Controller.extend
        needs: ["sign_in"]
        actions:
                reset: ->
                        this.setProperties(
                                old_password: ""
                                password: ""
                                password_conf: ""
                        )
                update: ->
                        self = this
                        old = this.get('old_password')
                        password = this.get('password')
                        password_confirmation = this.get('password_conf')
                        
                        self.set('errorMessage', null)
                        request = Ember.$.ajax('/api/v1/accounts/update', {
                                "beforeSend": (xhr) ->
                                        xhr.setRequestHeader('Authorization', 'Token token=' + self.get('controllers.sign_in.token'))
                                "type":'PUT'
                                "dataType": 'JSON'
                                "data": { "user": {"old_pass": old, "password": password, "password_confirmation": password_confirmation }}})
                                .then( (response) ->
                                        if( response.status == "success")
                                                self.transitionToRoute('/student_dashboard')
                                                App.FlashQueue.pushFlash('notice', "Profile Updated")
                                        else
                                                self.set('errorMessage', response.errors))
