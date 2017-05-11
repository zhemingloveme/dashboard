checkUserSigned = (context, redirect) ->
	if !Meteor.userId()
		FlowRouter.go '/steedos/sign-in';

dashboardRoutes = FlowRouter.group
	triggersEnter: [ checkUserSigned ],
	prefix: '/dashboard',
	name: 'dashboardRoutes'


dashboardRoutes.route '/',
	action: (params, queryParams)->
		Tracker.autorun (c)->
			if Steedos.subsBootstrap.ready("my_spaces")
				spaceId = Steedos.getSpaceId()
				if spaceId
					c.stop()
					FlowRouter.go "/dashboard/space/#{spaceId}/xxx"


dashboardRoutes.route '/space/:spaceId/:dashboardId', 
	action: (params, queryParams)->
		Steedos.setSpaceId(params.spaceId)
		Session.set("dashboardId", params.dashboardId)

		BlazeLayout.render 'dashboardLayout',
			main: "dashboardView"

