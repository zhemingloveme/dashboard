@Dashboard = {}

Meteor.startup ->
	Steedos.API.setAppTitle("Steedos Dashboard");
	$("body").css("background-image", "url('/packages/steedos_theme/client/background/birds.jpg')");
