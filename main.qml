import QtQuick
import QtQuick.Window

Window {
	width: 640
	height: 240
	visible: true
	color: "#222"

	property var things: []

	component Cell : Text {
		font.family: "monospace"
		font.pointSize: 10
		color: "#888"
	}

	Column {
		anchors.fill: parent
		anchors.margins: 5
		spacing: 5
		Repeater {
			model: things
			delegate: Row {
				spacing: 10
				Cell { text: modelData.id }
				Cell { text: modelData.state }
				Cell { text: modelData.late }
				Cell { text: modelData.vol }
				Cell { text: modelData.api }
				Cell { text: modelData.name }
			}
		}
	}

	Timer {
		interval: 1000
		running: true
		repeat: true
		triggeredOnStart: true
		onTriggered: parseData()
	}

	// this is propably "very" inefficient, but i'm lazy and just playing around...
	function parseData () {
		let idPad =    2
		let statePad = 9
		let latePad =  10
		let apiPad =   14
		let volDec =   2
		let data = JSON.parse(pw.getData())

		things = [{
			id:    "ID",
			state: "State".padEnd(statePad, " "),
			late:  "Latency".padEnd(latePad, " "),
			api:   "API".padEnd(apiPad, " "),
			vol:   "Volm",
			name:  "Name",
		}]

		for (let d of data) {
			if (d.type !== "PipeWire:Interface:Node")
				continue

			let name = d.info.props["node.nick"] ?? d.info.props["node.name"]
			let api  = d.info.props["client.api"] ?? "driver"
			let late = String(d.info.props["node.latency"])
			let vols = d.info.params.Props ? (
				d.info.params.Props[0].channelVolumes ?
					d.info.params.Props[0].channelVolumes : [0]
			) : [0]

			things.push({
				id:    d.id.toString().padEnd(idPad, " "),
				state: d.info.state.padEnd(statePad, " "),
				late:  late.padEnd(latePad, " "),
				api:   api.padEnd(apiPad, " "),
				vol:   vols[0].toFixed(volDec), // TODO: get average of all channels?
				name:  name
			})
		}

		thingsChanged()
	}
}
