App.AddActivityComponent = Ember.Component.extend
        tagName: 'li'
        classNames: ['add-component']
        actions:
                show: ->
                        this.set("isAdding", true)
                hide: ->
                        this.set("name", null)
                        this.set("isAdding", false)

                create: ->
                        this.sendAction('action' , { name: this.get('name') }, this.get("cId"))

                        
