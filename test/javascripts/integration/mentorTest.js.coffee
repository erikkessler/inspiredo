module "Mentor - Integration Test", {
        setup: ->
                App.reset()
                Ember.run(App, App.advanceReadiness)
    
        teardown: ->

}
 
test "Valid Login", ->
        visit("/sign_out")
        visit("/sign_in")

        fillIn("#email", "erik@inspiredo.com")
        fillIn("#password", "camcam")

        click("button.submit")

        andThen ->
                equal(find("#user-email").text, "erik@inspiredo.com", "email is the signed in user")
                
 

