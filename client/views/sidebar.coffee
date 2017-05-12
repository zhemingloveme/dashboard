Template.dashboardSidebar.helpers
	
	dashboardList: ()->
		spaceId = Steedos.spaceId()
		return db.portal_dashboards.find({space:spaceId}).fetch()

Template.dashboardSidebar.events
	"click .btn-new-dashboard":(event,template)->
		$(".btn-add-dashboard").click()

	"click .btn-edit-dashboard":(event,template)->
		dashboardId = event.currentTarget.dataset.dashboard
		console.log "dashboardId is:#{dashboardId}"
		editDashboard = db.portal_dashboards.findOne({_id:dashboardId})
		console.log "editDashboard is:#{editDashboard}"
		Session.set 'cmDoc',editDashboard
		$(".btn-dashboard-edit").click()
