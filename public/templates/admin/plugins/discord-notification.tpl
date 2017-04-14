<form role="form" class="discord-notification-settings">
	<div class="row">
		<div class="col-sm-2 col-xs-12 settings-header">Webhook</div>
		<div class="col-sm-10 col-xs-12">
			<div class="form-group">
				<label for="WebhookID">ID</label>
				<input type="text" class="form-control" id="WebhookID" name="WebhookID" />
				<p class="help-block">Webhook ID is the first group of numbers in the webhook URL</p>
			</div>
			<div class="form-group">
				<label for="WebhookToken">Token</label>
				<input type="text" class="form-control" id="WebhookToken" name="WebhookToken" />
				<p class="help-block">Token is the last part of the webhook URL</p>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-2 col-xs-12 settings-header">Notifications</div>
		<div class="col-sm-10 col-xs-12">
			<div class="form-group">
				<label for="MaxLength">Maximum Content Length</label>
				<input type="number" class="form-control" id="MaxLength" name="MaxLength" min="1" max="1024" value="100" />
				<p class="help-block">Up to 1024 characters</p>
			</div>
			<div class="form-group">
				<label for="PostCategories">Categories</label>
				<select class="form-control" id="PostCategories" name="PostCategories" size="10" multiple></select>
			</div>
			<div class="checkbox">
				<label for="TopicsOnly" class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input type="checkbox" class="mdl-switch__input" id="TopicsOnly" name="TopicsOnly" />
					<span class="mdl-switch__label">Notify for new topics only</span>
				</label>
			</div>
		</div>
	</div>
</form>

<button id="save" class="floating-button mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
	<i class="material-icons">save</i>
</button>

<script>
	$(document).ready(function() {
		socket.emit('categories.get', function(err, data) {
			categories = data;
			for (var i = 0; i < categories.length; ++i) {
				$('#PostCategories').append('<option value=' + categories[i].cid + '>' + categories[i].name + '</option>');
			}
		});
	});

	require(['settings'], function(Settings) {
		Settings.load('discord-notification', $('.discord-notification-settings'));

		$('#save').on('click', function() {
			Settings.save('discord-notification', $('.discord-notification-settings'), function() {
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
	});
</script>
