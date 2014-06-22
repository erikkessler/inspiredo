App.StudentController = Ember.Controller.extend

        actions:
                test: ->
                        person = this.store.find('student', 1)
                        console.log(person)
                        console.log(person.get('name'))
                
