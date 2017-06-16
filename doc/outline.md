* Intro
* High Value Testing Is About Conversations
  * Last Talk: Messages Between Models
  * This Talk: Messages From Your Suite To Another Human
* Fowler Quote: "Any idiot can write code a computer can understand. Good
  programmers write code that humans can understand."
* Four Humans Who Have Come To Your Test Suite, Each With A Different Question
  * "Does It Work?" - `bundle exec rspec --format=progress` - "Don't talk to me, just show me green dots"
  * "It Doesn't Work. What's Going On?"
  * "It Works! What Does It Do?"
  * "It Works! How Do I Use It?"

* TL;DR? Answering The Four Questions
  * "Does It Work?" - `bundle exec rspec --format=progress` - "Don't talk to me,
    just show me green dots and show me green." PROTIP: Don't push PRs with
    pending specs. They change the suite summary from passing green to warning
    yellow. This doesn't just look ugly, it clearly communicates that you've
    left unfinished business in your code. It immeidately lowers confidence in
    the test suite and in turn lowers the value of your test suite to the human
    asking the question. Fix the spec or remove it. A bug that needs fixed
    should be in JIRA, not the test suite. Remove the spec and trust that
    maintainer to re-add it later. If it makes you feel better, cut the spec and
    paste it onto the JIRA card. I've seen specs that have been pending for over
    two years. Heretical thought: It's okay to declare bankruptcy on these. Just
    delete them. If you can't bring yourself to delete it, move it to JIRA and
    let business prioritize it. If you can't bring yourself to throw it away or
    schedule it, YOU MUST DO IT NOW.
  * "It Doesn't Work. What's Going On?" PROTIP: Break your spec and read its
    failure message. Does it clearly tell the story? (Is it even an english
    sentence?) Because of this, never use `it/specify` without a description.
  * "It Works! Cool Code, What Does It Do?"
    PROTIP: Run your specs with `--format=documentation --order=defined`. Does
    it tell a story? Does it tell the whole story? Does it reveal the right
    details? Know the difference between `describe` and `contetxt`. Know the
    difference between `it_behaves_like` and `include_examples`.
  * "It Works! Cool Code, How Do I Use It?"  PROTIP: Read your spec code. Does
    each `it` block read like a complete code sample? Is there a clear Arrange
    inside, or at least close to, the test case? Does the Act take place inside
    the test case? Know the difference between `it`, `specify` and
    `example`. Know the `describe Object/context Condition/it Behaves`
    pattern. Know the `describe Behavior/example Condition` pattern.

* Let's Define Test Suite Value as Worth/Cost (Good Definition, But Impossible To Measure)
* Concrete Metrics Are Hard To Obtain, But There Are Some Intuitive Ones (Sandi Metz, 99bottles)
  1. Understandability
  2. Can You Tell What Changes
  3. Can You Tell What Stays The Same
* DRY vs. WET
  * Change vs Same Leads Us to DRY
  * DRY trades duplication/shotgun surgery/cut-and-paste errors for clean, single sources of truth
  * DRY is not free: it increases the cognitive load of implication and definition
* Interlude: Let's Talk About Cognitive Load
  * Cognitive Load is a scarce resource
  * The human confronted by your spec suite is getting paid to do their job
  * Unless they are actively extending or chainging your code, their job is to *do something else*
  * This means their cognitive capacity is already dedicated to other problems
  * IOW: They're Not Dumb, You're Just Not That Important (To Them, Right Now, In This Specific Instance)
* DRY vs. WET vs. AAA
  * Change vs Same Leads Us to DRY
  * DRY trades duplication/shotgun surgery/cut-and-paste errors for clean, single sources of truth
  * DRY is not free: it increases the cognitive load of implication and definition
  * WET trades implication and definition for clear and present meaning
  * Let's Talk About AAA
* AAA
  * Arrange - Establish the situation or scenario
  * Act - Do the thing under test
  * Assert - Make assertions about the outcome
* If You Only Take Four Things Away From This talk...
  1. Finish or murder your pending specs. If you can't finish them, put them in
     JIRA or put them down.
  2. DO NOT ACT WHEN ARRANGING (If you only take one thing, take this one)
    * Especially, in request specs, Do not `post(request_params)` in your before
      block
    * If you're Arranging an object to be in a certain state, *that's the act!*
    * Don't put the Act in the subject and then call it in the spec
    * If you have one line of code in your test case, and it's the assert, it's
      probably not a good example
  3. Don't DRY your specs up
    * Try to make each test case show the full AAA
    * Don't extract the Arrange unless it is so big it confuses the Act and
      Assert
    * If you do extract, move them no further than necessary. Further = more
      cognitive load. Top of context is better than top of file is better than
      in a shared support file is better than in a separate gem
    * The best fixture is no fixture. Use `.new`, it may surprise you how much
      easier your code will become to test.
    * Don't extract a fixture from a file if it spans multiple files. ONLY
      extract fixtures that represent contracts between multiple files. ONLY
      extract fixtures from a project that represent contracts between multiple
      projects.
    * Test cases should ONLY be one line long if they have no
      dependencies. E.g. if you can say `Assert(class.new(Arrange).Act())` then
      go for it.
    * Rule of Thumb: If you write a let before you write the it, you are almost
      certainly erring on the side of bad specs. This is not harmless. It feels
      good because you are leveraging your experience with the code, but you are
      imposing a cognitive load cost on the next maintainer who does not have
      your experience. The best spec code requires the least familiarity with
      the code.
  4. Leverage the documentation format
    * Make sure your contexts and it block stack up into a complete sentence
    * Make sure all your blocks stack up to tell the whole story
