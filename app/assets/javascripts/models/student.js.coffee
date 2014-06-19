App.Student = DS.Model.extend
        name: DS.attr('string')
        recent: DS.attr()
        contracts: DS.attr()
        

App.Student.FIXTURES = [
        {
                id: 1
                name: 'Cam Kessler'
                recent: [
                        {
                                title: 'Practice Lax'
                                date: new Date()
                                type: 0
                                },
                        {
                                title: 'Drink Glass of Water'
                                date: new Date(2014, 5, 19, 14, 59, 0)
                                type: 0
                                },
                        {
                                title: 'Wake Before 7'
                                date: new Date(2014, 5, 19, 14, 51, 0)
                                type: 0
                                },
                        {
                                title: 'Earned 10 points'
                                date: new Date(2014, 5, 18)
                                type: 1
                                },
                        {
                                title: 'Bed before 11'
                                date: new Date(2014, 5, 19, 5, 51, 0)
                                type: 0
                                }
                        ]

                contracts: [
                        {
                                name: 'Lacrosse'
                                stats: {
                                        earned: 120
                                        left: 180
                                        average: 12
                                        days_left: 20
                                        needed_avg: 10
                                        }
                                activities: [
                                        {
                                                name: "Wake before 7"
                                                },
                                        {
                                                name: "Drink glass of water"
                                                },
                                        {
                                                name: "Bed before 11"
                                                }
                                        ]
                                reward: {
                                        name: "MacBook Pro"
                                        image: "/assets/mac.png"
                                        }
                                },
                                {
                                name: 'Keystone Habits'
                                stats: {
                                        earned: 60
                                        left: 240
                                        average: 6
                                        days_left: 20
                                        needed_avg: 10
                                        }
                                activities: [
                                        {
                                                name: "Flexibility"
                                                },
                                        {
                                                name: "Wall Ball"
                                                },
                                        {
                                                name: "Lift"
                                                }
                                        ]
                                reward: {
                                        name: "iPhone"
                                        image: "/assets/iphone.png"
                                        }
                                }
                                
                        ]
                        
        }
        {
                id: 2,
                name: 'Ronnie Eastman'
        }
        {
                id: 3,
                name: 'Nick Brindisi'
        }
]
