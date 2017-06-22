<form role="form" class="discord-notification-settings">
	<div class="row">
		<div class="col-sm-2 col-xs-12 settings-header">[[discord-notification:webhook]]</div>
		<div class="col-sm-10 col-xs-12">
			<div class="form-group">
				<label for="webhookURL">[[discord-notification:webhook-url]]</label>
				<input type="text" class="form-control" id="webhookURL" name="webhookURL" />
				<p class="help-block">[[discord-notification:webhook-help]]</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-xs-12 settings-header">[[discord-notification:notification]]</div>
		<div class="col-sm-10 col-xs-12">
			<div class="form-group">
				<label for="messageContent">[[discord-notification:message-content]]</label>
				<input type="text" class="form-control" id="messageContent" name="messageContent" />
				<p class="help-block">[[discord-notification:content-help]]</p>
			</div>
		</div>
		<div class="col-sm-10 col-xs-12">
			<div class="form-group">
				<label for="maxLength">[[discord-notification:notification-max-length]]</label>
				<input type="number" class="form-control" id="maxLength" name="maxLength" min="1" max="1024" value="100" />
				<p class="help-block">[[discord-notification:notification-max-length-help]]</p>
			</div>
			<div class="form-group">
				<label for="postCategories">[[discord-notification:post-categories]]</label>
				<select class="form-control" id="postCategories" name="postCategories" size="10" multiple></select>
			</div>
			<div class="checkbox">
				<label for="topicsOnly" class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input type="checkbox" class="mdl-switch__input" id="topicsOnly" name="topicsOnly" />
					<span class="mdl-switch__label">[[discord-notification:topics-only]]</span>
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
				$('#postCategories').append('<option value=' + categories[i].cid + '>' + categories[i].name + '</option>');
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
