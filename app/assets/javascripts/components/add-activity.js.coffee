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
                        this.sendAction('action' , { name: this.get('name'), value: this.get('value'), contract_id: this.get("con")})
                        this.set("name", null)
                        this.set("value", null)
                        this.set("isAdding", false)

                        
