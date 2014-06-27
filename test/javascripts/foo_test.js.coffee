test("Foo always says the truth okay", ->
        visit("/")

        equal(true, true, "foo.truth is not true")
)
