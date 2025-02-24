extends Resource
class_name UIRouter

var routes : Dictionary[String, UIRoute] = {}
var route_stack : Array[String]

func register_route(route:UIRoute):
	if !routes.has(route.route_name):
		routes.set(route.route_name, route)
	else:
		printerr(
			"Only one route with route name: ", 
			route.route_name, 
			" Can be registered at once!"
		)
	
func unregister_route(route:UIRoute):
	if route_stack.has(route.route_name):
		route_stack = route_stack.filter(func(x): x != route.route_name)
	if routes.has(route.route_name):
		routes.erase(route.route_name)

func open_route(route_name:String):
	print("Trying to open route: ", route_name)
	if routes.has(route_name):
		#close the current route if it's open
		if len(route_stack) > 0:
			var last = route_stack[-1]
			routes[last].close_route()
		# open the new route
		routes[route_name].open_route()
		# make it the current route
		# put it on top of the stack
		route_stack.push_back(route_name)
			
			
func back():
	#close the last route in the stack if it exists
	print("Going back, route stack count: ", len(route_stack))
	print(route_stack)
	if len(route_stack) > 0:
		var last = route_stack.pop_back()
		print("Going back, closing: ", last)
		routes[last].close_route()
	# get the new top of the stack if there is one
	if len(route_stack) > 0:
		var new_last = route_stack[-1]
		print("Going back, opening last: ", new_last)
		routes[new_last].open_route()

func toggle_route(route_name:String):
	if route_stack.has(route_name):
		close_all()
	else:
		open_route(route_name)

func close_all():
	for item in route_stack:
		routes[item].close_route()
	route_stack.clear()
	
func open_route_count() -> int:
	return len(route_stack)
