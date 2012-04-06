class TestWunderkitLogins < Spinach::FeatureSteps
  Given 'I open the login page' do
    if not defined?($browser)
      $browser = Watir::Browser.new :chrome
    end
    if $browser.span(:class, "wk-icon settings").exist?
      $browser.span(:class, "wk-icon settings").click
      $browser.link(:value, "Log out").click
    end
    $browser.goto $base_url + '/login'
  end

  And 'I fill in a valid username/password pair' do
    $browser.text_field(:name, "email").set "wunderkittest@gmail.com"
    $browser.text_field(:name, "password").set "password"
  end

  When 'I click the login button' do
    $browser.button(:value, "Log in").click
  end

  Then 'the output should contain a formal greeting' do
    sleep 15
    $browser.text.should include("Home")
  end

  And 'I fill in an invalid username/password pair' do
    $browser.text_field(:name, "email").set "wunderkittest-non-existing@gmail.com"
    $browser.text_field(:name, "password").set "password"
  end

  Then 'the output should contain an invalid-credential error' do
    $browser.span(:class, "wk-icon attention").should exist
    $browser.span(:class, "wk-icon attention").fire_event("onmouseover")
  end
  Then 'I log out' do
    if $browser.span(:class, "wk-icon settings").exist?
      $browser.span(:class, "wk-icon settings").click
      $browser.link(:text, "Log out").click
    end
  end
end

