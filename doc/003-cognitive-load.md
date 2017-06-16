# Cognitive Load and DRY vs WET

* Value = Worth / Cost
* Easy To Define, Hard To Measure
* You Can't Maintain What You Can't Understand
* Sandi Metz: What changes? What stays the same?
* DRY
* Specs: DRY... not so great
  * Too much DRY: unioned roles, unmaintainable specs
  * Medium DRY: still kinda bad, cognitive load
  * But Surely Just A Little DRY?
    * Might not be a minimum safe dose
    * Consider making DRY NOT your default
    * My point is not that DRY is bad, but that it's just not *free*. Caveat
      Emptor: Know what it's buying you, because you *are* paying for it.
* Consider defaulting to WET
* Does each spec tell enough of the story?
* A failing spec is a microcosm unto itself--if it's not your app, it's your
  whole world
* Taking your eyes off the problem = cognitive load
* The further you move, the more the load
  * lets vs constants
  * before (this context)
  * before(at top of file)
  * special case: before(somewhere between here and the top)
  * before(:all)
  * before(:suite)
  * shared contexts
  * shared code in another repository
* Caveat: Everything's A Tradeoff, TMA AYOP
* Caveat Caveat: Everything's A Tradeoff, IMA AYOP
