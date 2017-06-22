(function(module) {
	'use strict';

	var User = module.parent.require('./user');
	var Topics = module.parent.require('./topics');
	var Categories = module.parent.require('./categories');
	var translator = module.parent.require('../public/src/modules/translator');
	var meta = module.parent.require('./meta');
	var nconf = module.parent.require('nconf');
	var async = module.parent.require('async');

	var Discord = require('discord.js');

	var hook = null;

	var plugin = {
			config: {
				webhookURL: '',
				maxLength: '',
				postCategories: '',
				topicsOnly: ''
			},
			regex: /https:\/\/discordapp\.com\/api\/webhooks\/([0-9]+?)\/(.+?)$/
		};

	plugin.init = function(params, callback) {
		function render(req, res, next) {
			res.render('admin/plugins/discord-notification', {});
		}

		params.router.get('/admin/plugins/discord-notification', params.middleware.admin.buildHeader, render);
		params.router.get('/api/admin/plugins/discord-notification', render);

		meta.settings.get('discord-notification', function(err, settings) {
			for (var prop in plugin.config) {
				if (settings.hasOwnProperty(prop)) {
					plugin.config[prop] = settings[prop];
				}
			}

			// Parse Webhook URL (1: ID, 2: Token)
			var match = plugin.config['webhookURL'].match(plugin.regex);

			if (match) {
				hook = new Discord.WebhookClient(match[1], match[2]);
			}
		});

		callback();
	},

	plugin.postSave = function(post) {
		post = post.post;
		var topicsOnly = plugin.config['topicsOnly'] || 'off';
		var messageContent = plugin.config['messageContent'] || '';

		if (topicsOnly === 'off' || (topicsOnly === 'on' && post.isMain)) {
			var content = post.content;

			async.parallel({
				user: function(callback) {
					User.getUserFields(post.uid, ['username', 'picture'], callback);
				},
				topic: function(callback) {
					Topics.getTopicFields(post.tid, ['title', 'slug'], callback);
				},
				category: function(callback) {
					Categories.getCategoryFields(post.cid, ['name', 'bgColor'], callback);
				}
			}, function(err, data) {
				var categories = JSON.parse(plugin.config['postCategories']);

				if (!categories || categories.indexOf(String(post.cid)) >= 0) {
					// Trim long posts:
					var maxContentLength = plugin.config['maxLength'] || 1024;
					if (content.length > maxContentLength) { content = content.substring(0, maxContentLength) + '...'; }

					// Ensure absolute thumbnail URL:
					var thumbnail = data.user.picture.match(/^\//) ? nconf.get('url') + data.user.picture : data.user.picture;

					// Make the rich embed:
					var embed = new Discord.RichEmbed()
						.setColor(data.category.bgColor)
						.setURL(nconf.get('url') + '/topic/' + data.topic.slug)
						.setTitle(data.category.name + ': ' + data.topic.title)
						.setDescription(content)
						.setFooter(data.user.username, thumbnail)
						.setTimestamp();

					// Send notification:
					if (hook) {
						hook.sendMessage(messageContent, {embeds: [embed]}).catch(console.error);
					}
				}
			});
		}
	},

	plugin.adminMenu = function(headers, callback) {
		translator.translate('[[discord-notification:title]]', function(title) {
			headers.plugins.push({
				route : '/plugins/discord-notification',
				icon  : 'fa-bell',
				name  : title
			});

			callback(null, headers);
		});
	};

	module.exports = plugin;

}(module));
