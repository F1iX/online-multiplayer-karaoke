#!/bin/bash
export MUMBLE_URL=

main() {
	create_output_devices
	create_input_devices_mirroring_output
	start_mumble_listeners
}

create_output_devices() {
	echo "Creating output devices (sink) for audio streams"
	pactl load-module module-null-sink sink_name="KaraokeStream1" sink_properties='device.description="KaraokeStream1"'
	pactl load-module module-null-sink sink_name="KaraokeStream2" sink_properties='device.description="KaraokeStream2"'
	pactl load-module module-null-sink sink_name="KaraokeOutput" sink_properties='device.description="KaraokeOutput"'
}

create_input_devices_mirroring_output() {
	echo "Creating virtual microphones (input/source) mirroring audio streams"
	pactl load-module module-virtual-source source_name="KaraokeMic1" master=KaraokeStream1.monitor
	pactl load-module module-virtual-source source_name="KaraokeMic2" master=KaraokeStream2.monitor
	pactl load-module module-virtual-source source_name="KaraokeOutputShare" master=KaraokeOutput.monitor
}

start_mumble_listeners() {
	echo "Starting mumble listeners"
	mumble -m listener1.ini mumble://Listener1@$MUMBLE_URL/Player1 &
	mumble -m listener2.ini mumble://Listener2@$MUMBLE_URL/Player2 &
}

main
