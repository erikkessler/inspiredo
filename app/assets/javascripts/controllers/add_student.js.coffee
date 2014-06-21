App.DashboardAddStudentController = Ember.Controller.extend
        actions:
                invite: ->
                        self = this
                        email = this.get('email')
                        name = this.get('name')

                        self.set('errorMessage', null)
                        request = Ember.$.ajax('/api/v1/accounts/sign_up', {
                                "type":'POST'
                                "dataType": 'JSON'
                                "data": { "user": {"email": email, "is_mentor": "false", "is_student": "true" }}})
                                .then( (response) ->
                                        if( response.status == "success")
                                                this.get('student').reload
                                        else
                                                self.set('errorMessage', response.error))