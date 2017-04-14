# Discord Notifications for NodeBB

[![npm](https://img.shields.io/npm/v/nodebb-plugin-discord-notification.svg)](https://www.npmjs.com/package/nodebb-plugin-discord-notification) [![npm downloads](https://img.shields.io/npm/dt/nodebb-plugin-discord-notification.svg)](https://www.npmjs.com/package/nodebb-plugin-discord-notification)

Send notifications of new posts and topics via [Discord](https://discordapp.com/) webhook.

It’s like [NodeBB Slack](https://github.com/pichalite/nodebb-plugin-slack-extended) plugin, but for Discord. Fancy rich embeds included.  
For now it requires latest [discord.js](https://github.com/hydrabolt/discord.js/) from GitHub (discord.js v11.0.0, latest in NPM, doesn’t handle webhooks well enough).

## Configuration

1. Install the plugin and activate it.
2. Create a Discord webhook (Server Settings &rarr; Webhooks).  
    You’ll get an URL like `https://discordapp.com/api/webhooks/<Webhook ID>/<Webhook Token>`.
3. Fill in **ID** and **Token** fields on the plugin settings page.
4. Restart NodeBB.

## Screenshot

![ACP](screenshots/ui.png)
