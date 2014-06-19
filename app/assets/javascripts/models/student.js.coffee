App.Student = DS.Model.extend
        name: DS.attr('string')

App.Student.FIXTURES = [
        {
                id: 1,
                name: 'Cam Kessler'
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
