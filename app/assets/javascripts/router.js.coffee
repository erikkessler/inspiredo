# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
        this.route('home', { path: "/" })
        this.route('sign_in', { path: "sign_in" })
        this.route('sign_out', { path: "sign_out" })
        this.resource('dashboard', { path: "dashboard"}, ->
                this.resource('dashboard.student', { path: ":student_id" }, ->
                        this.route('create_contract', { path: "create_contract" }))
                this.route('add_student', { path: "add" })
                this.route('profile', { path: "profile"}))
        this.resource('student_dashboard', { path: "student_dashboard" }, ->
                this.resource('student_dashboard.contract', { path: ":contract_id" })
                this.route('today', { path: '/' })
                )
        this.route('sign_up',{ path: "sign_up" })


App.Router.reopen
        location: 'auto'

