# Minimal test app for Warden/Rails issue

See [this question](http://stackoverflow.com/questions/37808531/no-status-code-in-rails-log-after-warden-auth-failure) on stackoverflow for background.

This app uses Warden with a "locked" strategy that always fails to authenticate, resulting in the odd missing HTTP status in logs.

Warden middleware is added by `config/warden.rb`, and authentication is triggered by a `before_action` in the application controller.

There's only one route (`/widgets`), which will just print "Hello, world" - except of course that Warden doesn't let anything past, so the request will just result in a `401 Unauthorized` with no content.

