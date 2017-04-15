FlowRouter.route '/',
	action: (params, queryParams)->
		BlazeLayout.render 'dashboardLayout',
			main: "dashboardHome"

