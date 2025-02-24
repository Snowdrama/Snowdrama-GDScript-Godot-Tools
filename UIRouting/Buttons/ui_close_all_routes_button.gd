extends UIRouteButton
class_name UICloseAllRoutesButton

func on_pressed():
	self.router.close_all()
