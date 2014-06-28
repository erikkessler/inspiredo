App.DashboardAddStudentController = Ember.Controller.extend
        needs: ["sign_in",'dashboard']

        actions:
                invite: ->
                        console.log(this.get('controllers.dashboard').store.find('student'))
                        self = this
                        email = this.get('email')
                        console.log(self.get('controllers.sign_in.token'))
                        

                        self.set('errorMessage', null)
                        request = Ember.$.ajax('/api/v1/accounts/sign_up', {
                                "beforeSend": (xhr) ->
                                        xhr.setRequestHeader('Authorization', 'Token token=' + self.get('controllers.sign_in.token'))
                                "type":'POST'
                                "dataType": 'JSON'
                                "data": { "user": {"email": email, "is_mentor": "false", "is_student": "true" }, "mentor": "Erik Kessler"}})
                                .then( (response) ->
                                        if( response.status == "success")
                                                console.log("ok")
                                                App.FlashQueue.pushFlash('notice', 'Added ' + name)
                                                self.get('controllers.dashboard').store.find('student')
                                        else
                                                App.FlashQueue.pushFlash('error', response.error))
