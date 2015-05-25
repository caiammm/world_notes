				
				<!--PESQUISAR -->
			(function() {
					var bttn = document.getElementById( 'notification-pesquisar' );
					// make sure..
					bttn.disabled = false;
					bttn.addEventListener( 'click', function() {
					// create the notification
					var notification = new NotificationFx({
						message : '<p class="login">Digite o que você procura <input maxlength="30" class="input_login" type=text> <input type="submit" value="Buscar"></p>',
						layout : 'bar',
						effect : 'exploader',
						ttl : 9000000,
						type : 'notice', // notice, warning or error
						onClose : function() {
							bttn.disabled = false;
						}
					});
					// show the notification
					notification.show();
					// disable the button (for demo purposes only)
					this.disabled = true;
					} );
				})();
				
				
				<!--LOGIN -->
				(function() {
					var bttn = document.getElementById( 'notification-login' );
					// make sure..
					bttn.disabled = false;
					bttn.addEventListener( 'click', function() {
					// create the notification
					var notification = new NotificationFx({
						message : '<p class="login">Login <input maxlength="8" type=text> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Senha  <input maxlength="8" type=text>  <input type="submit" value="Enviar"></p>',
						layout : 'bar',
						effect : 'exploader',
						ttl : 9000000,
						type : 'notice', // notice, warning or error
						onClose : function() {
							bttn.disabled = false;
						}
					});
					// show the notification
					notification.show();
					// disable the button (for demo purposes only)
					this.disabled = true;
					} );
				})();
			
			