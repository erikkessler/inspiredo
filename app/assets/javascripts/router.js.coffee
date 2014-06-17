# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
        this.route('sign_in', { path: "/sign_in" })


App.Router.reopen
        location: 'auto'

