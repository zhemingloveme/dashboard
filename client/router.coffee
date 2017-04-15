FlowRouter.route '/',
	action: (params, queryParams)->
		FlowRouter.go '/dashboard/b/default'


FlowRouter.route '/dashboard/b/default',
	action: (params, queryParams)->
		BlazeLayout.render 'dashboardLayout',
			main: "dashboardView"