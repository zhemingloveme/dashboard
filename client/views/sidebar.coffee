Template.dashboardSidebar.helpers
	
	dashboardList: ()->
		spaceId = Steedos.spaceId()
		return db.portal_dashboards.find({space:spaceId}).fetch()