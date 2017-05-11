Dashboard.helpers =
	subsReady: ->
		return Steedos.subsBootstrap.ready()
	dashboardId: ->
		return Session.get("dashboardId")
