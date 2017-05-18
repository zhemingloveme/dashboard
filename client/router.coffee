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
			if Steedos.subsBootstrap.ready("my_spaces") and Steedos.subsBootstrap.ready("portal_dashboards")
				spaceId = Steedos.getSpaceId()
				if spaceId
					dashboard = db.portal_dashboards.findOne({space:spaceId},{sort:{created:-1}})
					dashboardId = dashboard._id
					c.stop()
					FlowRouter.go "/dashboard/space/#{spaceId}/#{dashboardId}"


dashboardRoutes.route '/space/:spaceId/:dashboardId', 
	action: (params, queryParams)->
		Steedos.setSpaceId(params.spaceId)
		Session.set("dashboardId", params.dashboardId)

		BlazeLayout.render 'dashboardLayout',
			main: "dashboardView"

