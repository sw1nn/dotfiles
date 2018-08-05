#!/home/neale/.virtualenvs/spotify_getinfo/bin/python3

import dbus
session_bus = dbus.SessionBus()

spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify",
                                     "/org/mpris/MediaPlayer2")
spotify_properties = dbus.Interface(spotify_bus,
                                    "org.freedesktop.DBus.Properties")
status = spotify_properties.Get("org.mpris.MediaPlayer2.Player",
                                "PlaybackStatus")
metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")

if status == "Playing":
    print(str(metadata.get('xesam:artist', [''])[0]) +
          " - " + str(metadata.get('xesam:title', '')))
