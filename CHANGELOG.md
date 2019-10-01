### 0.3.1
- Add support for Sidekiq Enterprise Encryption 

### 0.3.0

- **BREAKING CHANGE** `class.async` method is removed, use `delay.run` or alias it yourself
- **BREAKING CHANGE** Job class is no longer is created by default, you need to manually create it yourself
- added sidekiq support
- added alias `job` to `active_job` interaction class method
