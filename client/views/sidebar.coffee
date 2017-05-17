Template.dashboardSidebar.helpers
	liActive:(dashboardId)->
		currentDashboardId = Session.get "dashboardId"
		if dashboardId == currentDashboardId
			return "active"
	
	dashboardList: ()->
		spaceId = Steedos.spaceId()
		return db.portal_dashboards.find({space:spaceId}).fetch()

Template.dashboardSidebar.events
	"click .btn-new-dashboard":(event,template)->
		$(".btn-add-dashboard").click()
