## Four Kinds Of Conversations Other People Want To Have With Your Code
1. Does It Just Work?
  * Hi I'm from `$OTHER_VERTICAL`, does your stuff work?
  * `bundle exec rspec --format=progress`
  * Show me green dots and shut up and go away
  * Green specs good (but can they be trusted?)
  * Yellow specs are bad (and you should feel bad)
  * Red specs are good (unless they're obscure)
  * Good specs pass and instill confidence that they're complete
     * Uncomment last context in `acting_in_the_arrange_spec.rb`
2. It Doesn't Work. What's Going On?
  * Hi! I work here, but I'm new and/or getting paid to solve `$OTHER_PROBLEM`
    instead of making your stuff go.
  * Good specs lead you to the problem, and give enough relevant details to
    explain how and why they failed
     * `shoulda_matchers_spec.rb`
     * `modern_shoulda_matchers_spec.rb`
     * `high_cognitive_load_spec.rb`
3. It Works! Cool Code! What's It Do?
  * WTF -> LGTM
  * Hello, I'm From RMT, So What's All This Then
  * This bit isn't tested, where do I put the *missing* spec?
  * Good spec suites tell an organized story
     * NewCrop specs (YES REALLY. I *KNOW*, RIGHT?!?)
     * `terse_language_spec.rb`
     * `trust_me_language_spec.rb`
     * `trust_me_terse_language_spec.rb`
4. It Works! Cool Code! I need to use it. WHAT DO?!?
  * Good specs are also good examples
     * `explicit_everything_spec.rb`
     * `aaa_one_liners_spec.rb`
