const settings = require('settings');
const hooks = require('hooks');

hooks.onPage('action:ajaxify.end', () => {
	// note: this is probably deprecated in core soon...
	socket.emit('categories.get', function(err, data) {
		categories = data;
		for (var i = 0; i < categories.length; ++i) {
			$('#postCategories').append('<option value=' + categories[i].cid + '>' + categories[i].name + '</option>');
		}
	});
})

settings.load('discord-notification', $('.discord-notification-settings'));

$('#save').on('click', function() {
	settings.save('discord-notification', $('.discord-notification-settings'), function() {
		app.alert({
			type: 'success',
			alert_id: 'discord-notification-saved',
			title: 'Settings Saved',
			message: 'Please reload your NodeBB to apply these settings',
			clickfn: function() {
				socket.emit('admin.reload');
			}
		});
	});
});
