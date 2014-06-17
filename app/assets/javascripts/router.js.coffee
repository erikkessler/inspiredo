# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
        this.route('home', { path: "/" })
        this.route('sign_in', { path: "sign_in" })
        this.route('sign_out', { path: "sign_out" })
        this.route('dashboard', { path: "dashboard"})
        this.route('sign_up',{ path: "sign_up" })


App.Router.reopen
        location: 'auto'

