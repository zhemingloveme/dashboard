checkUserSigned = (context, redirect) ->
	if !Meteor.userId()
		FlowRouter.go '/steedos/sign-in';

dashboardRoutes = FlowRouter.group
	triggersEnter: [ checkUserSigned ],
	prefix: '/dashboard',
	name: 'dashboardRoutes'


dashboardRoutes.route '/',
	action: (params, queryParams)->
		FlowRouter.go "/dashboard/home"


dashboardRoutes.route '/home',
	action: (params, queryParams)->
		if Meteor.userId()
			BlazeLayout.render 'dashboardLayout',
				main: "dashboardView"



