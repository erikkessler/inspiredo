App.Student = DS.Model.extend
        email: DS.attr('string')
        recent: DS.attr()
        contracts: DS.hasMany('contract')
        

App.Student.FIXTURES = [
        {
                id: 1
                name: 'Nick Brindisi'
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
                recent: [
                        {
                                title: "20' math"
                                date: new Date()
                                type: 0
                                },
                        {
                                title: '20\' Khan Academy'
                                date: new Date(2014, 5, 19, 14, 59, 0)
                                type: 0
                                },
                        {
                                title: 'Earned 10 points'
                                date: new Date(2014, 5, 18)
                                type: 1
                                },
                        {
                                title: '20\' reading'
                                date: new Date(2014, 5, 19, 5, 51, 0)
                                type: 0
                                }
                        ]

                contracts: [
                        {
                                name: 'School'
                                stats: {
                                        earned: 120
                                        left: 180
                                        average: 12
                                        days_left: 20
                                        needed_avg: 10
                                        }
                                activities: [
                                        {
                                                name: "20' math"
                                                },
                                        {
                                                name: "20' reading"
                                                },
                                        {
                                                name: "20' Khan Academy"
                                                }
                                        ]
                                reward: {
                                        name: "Horse"
                                        image: "http://www.horsebreedsinfo.com/images/brown_horse_running.jpg"
                                        }
                                }
                                
                        ]
        }
        {
                id: 3,
                name: 'Cam Kessler'
                recent: [
                        {
                                title: 'Bed Before 10'
                                date: new Date()
                                type: 0
                                },
                        {
                                title: 'Wake Before 6'
                                date: new Date(2014, 5, 19, 14, 51, 0)
                                type: 0
                                },
                        {
                                title: 'Earned 10 points'
                                date: new Date(2014, 5, 18)
                                type: 1
                                },
                        {
                                title: 'Bed before 10'
                                date: new Date(2014, 5, 19, 5, 51, 0)
                                type: 0
                                }
                        ]

                contracts: [
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
                                                name: "Wake Up Before 6"
                                                },
                                        {
                                                name: "Bed Before 10"
                                                },
                                        {
                                                name: "No Mindless Screentime"
                                                }
                                        ]
                                reward: {
                                        name: "Nexus 5"
                                        image: "/assets/nexus.jpg"
                                        }
                                }
                                
                        ]
        }
]
