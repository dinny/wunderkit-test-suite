class TestWunderkitSignup < Spinach::FeatureSteps
  Given 'I open the login page' do
    if not defined?($browser)
      $browser=Watir::Browser.new :chrome
    end
    if $browser.span(:class, "wk-icon settings").exist?
      $browser.span(:class, "wk-icon settings").click
      $browser.link(:value, "Log out").click
    end
    $browser.goto $base_url + '/login'
  end

  And 'I click the sign up button' do
    $browser.link(:text, "Sign up").click
  end

  And 'I fill in a valid email' do
    now=Time.now.strftime("%Y%m%d%H%M%S")
    # refactar this to put $test_email in env.rb
    email = "dinny.wu+" + now + "@gmail.com"
    $browser.text_field(:name, "person[email]").set email
  end
  
  And 'I fill in an invalid email' do
   incorrect_email = "wrong-format@google"
   $browser.text_field(:name, "person[email]").set incorrect_email
  end

  And 'I fill in an already-taken email' do
   taken_email = "dinny.wu@gmail.com"
   $browser.text_field(:name, "person[email]").set taken_email
  end

  And 'I fill in other info' do
    $browser.text_field(:name, "person[name]").set "Wunderkit Tester"
    $browser.text_field(:name, "person[description]").set Time.now.to_s
    $browser.text_field(:name, "person[password]").set "password"
    $browser.text_field(:name, "person[password_confirmation]").set "password"
  end

  When 'I click the create-account button' do
    $browser.button(:value, "Create Account").click
  end

  Then 'the output should contain a formal greeting' do
    sleep 10
    $browser.text.should include("Account created")
  end

  Then 'the output should contain an already-registered error' do
    sleep 10
    $browser.text.should include("Validation failed - Email is already taken")
  end

  Then 'the output should contain an invalid-email error' do
    sleep 10
    $browser.text.should include("Email is invalid")
  end
  
  Then 'I log out' do
    $browser.goto $base_url + '/logout'
  end
end
