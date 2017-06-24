# Change Log

## [Unreleased]

### Todo

* Use current [NodeBB Settings Framework](https://nodebb.readthedocs.io/en/latest/plugins/settings.html).
* Add debug logging.


## [1.4.0] \(2017-06-24\)

### Added

* An option to set a custom message to be placed before an embedded content ([#6]).


## [1.3.1] \(2017-06-21\)

### Added

* Translate menu item’s title.

### Fixed

* Convert relative avatar URLs to absolute ([#4]).


## [1.3.0] \(2017-06-20\)

### Changed

* Update for compatibility with NodeBB 1.5.x.


## [1.2.0] \(2017-05-07\)

### Added

* ACP UI language files.


## [1.1.1] \(2017-05-06\)

### Fixed

* Webhook URL regular expression.

* Don’t try to send notification if the webhook is not configured.


## [1.1.0] \(2017-05-06\)

### Added

* Use category color as embed border color.

### Changed

* Switch to stable discord.js (^11.1.0).

* Switch to a single Webhook URL settings field (a workaround for [#1]).

    Since I could not find an example on how to update plugin configuration in DB, you have to purge old settings manually: `db.objects.remove({_key: "settings:discord-notification"});`


## [1.0.0] \(2017-04-14\)

Requires latest [discord.js](https://github.com/hydrabolt/discord.js/) from GitHub (discord.js v11.0.0, latest in NPM, doesn’t handle webhooks well enough).


[Unreleased]: https://github.com/amargon/city-of-doors/compare/v1.4.0...master
[1.4.0]: https://github.com/amargon/city-of-doors/releases/tag/v1.4.0
[1.3.1]: https://github.com/amargon/city-of-doors/releases/tag/v1.3.1
[1.3.0]: https://github.com/amargon/city-of-doors/releases/tag/v1.3.0
[1.2.0]: https://github.com/amargon/city-of-doors/releases/tag/v1.2.0
[1.1.1]: https://github.com/amargon/city-of-doors/releases/tag/v1.1.1
[1.1.0]: https://github.com/amargon/city-of-doors/releases/tag/v1.1.0
[1.0.0]: https://github.com/amargon/city-of-doors/releases/tag/v1.0.0


[#1]: https://github.com/amargon/nodebb-plugin-discord-notification/issues/1
[#4]: https://github.com/amargon/nodebb-plugin-discord-notification/issues/4
[#6]: https://github.com/amargon/nodebb-plugin-discord-notification/pull/6
