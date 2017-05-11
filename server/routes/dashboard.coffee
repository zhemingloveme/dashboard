Cookies = Npm.require("cookies")

JsonRoutes.add "post", "/api/dashboard/:dashboard_id", (req, res, next) ->
	user = Steedos.getAPILoginUser(req, res)
	if !user
		JsonRoutes.sendResult res,
			code: 401,
			data:
				"error": "Validate Request -- Missing X-Auth-Token,X-User-Id",
				"success": false
		return;

	userId = user._id

	dashboardId = req.params?.dashboardId
	unless dashboardId
		JsonRoutes.sendResult res,
			code: 401,
			data:
				"error": "Validate Request -- Missing dashboardId",
				"success": false
		return;

	freeboard = req.body?.freeboard
	unless freeboard
		JsonRoutes.sendResult res,
			code: 401,
			data:
				"error": "Validate Request -- Missing freeboard content",
				"success": false
		return;

	dashboard = db.portal_dashboards.findOne dashboardId, {fields:{space:1}}
	spaceId = dashboard.space
	unless Steedos.isSpaceAdmin spaceId, userId
		JsonRoutes.sendResult res,
			code: 401,
			data:
				"error": "Validate Request -- No permission",
				"success": false
		return;

	doc = {}
	doc.freeboard = freeboard
	doc.modified_by = userId
	doc.modified = new Date()

	db.portal_dashboards.direct.update {
		_id: dashboardId
	}, $set: doc

	JsonRoutes.sendResult res,
		code: 200,
		data:
			"status": "success"
	return;
