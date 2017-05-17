Template.dashboardView.helpers Dashboard.helpers

Template.dashboardView.onRendered ->
	$("[data-toggle=offcanvas]").click();

Template.dashboardView.events
	"click .btn-edit-dashboard":(event,template)->
		dashboardId = Session.get "dashboardId"
		editDashboard = db.portal_dashboards.findOne({_id:dashboardId})
		Session.set 'cmDoc',editDashboard
		$(".btn-dashboard-edit").click()