# Discord Notifications for NodeBB

[![npm](https://img.shields.io/npm/v/nodebb-plugin-discord-notification.svg)](https://www.npmjs.com/package/nodebb-plugin-discord-notification) [![npm downloads](https://img.shields.io/npm/dt/nodebb-plugin-discord-notification.svg)](https://www.npmjs.com/package/nodebb-plugin-discord-notification) ![NodeBB Compatibility](https://packages.nodebb.org/api/v1/plugins/nodebb-plugin-discord-notification/compatibility.png)

Send notifications of new posts and topics via [Discord](https://discord.com/) webhook.

It’s like [NodeBB Slack](https://github.com/pichalite/nodebb-plugin-slack-extended) plugin, but for Discord. Fancy rich embeds included.

## Configuration

1. Install the plugin and activate it.
2. Create a Discord webhook (Server Settings &rarr; Integrations).  
    You’ll get an URL like `https://discord.com/api/webhooks/<Webhook ID>/<Webhook Token>`.
3. Fill in **Webhook URL** field on the plugin settings page.
4. Restart NodeBB.

## Customization

The border color of an embedded post excerpt depends on a background color of its category.

The **Message** field is optional and blank by default.  
Fill it in to set a custom short text to be placed before the embedded content.

For example, you can add some mentions as on the screenshot below.  
Use `@here` or `@everyone` as usual or type `<@UserID>` to mention a member, `<@&RoleID>` to mention a role and `<#ChannelID>` for a channel reference.

To get the IDs, enable Developer Mode (Discord App Settings &rarr; Appearance), right click a user or a channel and select *Copy ID*. The other way is to add a backslash to mentions in the chat (i.e `\@User`, `\@Role` or `\#Channel`).

## Support

This plugin is under **minimal maintenance**.

It was made for a forum I manage and published as-is for the benefit of the community. As long as that forum exists I might add simple bugfixes or compatibility updates if necessary, but anything more time-consuming than a couple of hours a month is just out of my hands.

All the unclear bug reports (you know, all these “It doesn’t work” ones without any notes on how to reproduce the issue) will be closed without comment.

**Pull requests are highly welcome and appreciated.**  
I might miss notifications from GitHub, so if I haven’t replied in a week or so, feel free to ping me.

## Screenshots

### Notification

![ACP](screenshots/message.png)

### ACP UI

![ACP](screenshots/ui.png)
