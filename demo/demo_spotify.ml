open Lwt
open Lwt_io
module Spotify = Mpris_spotify.Org_mpris_MediaPlayer2_Player

let print_playback_status proxy =
  lwt playback_status =
    OBus_property.get (Spotify.playback_status proxy) in
  printlf "Playback status = %s" playback_status

let print_metadata_title proxy =
  lwt metadata =
    OBus_property.get (Spotify.metadata proxy) in
  let title = List.assoc "xesam:title" metadata in
  match title with
  | OBus_value.V.Basic (OBus_value.V.String s) ->
    printlf "Now playing: %s" s
  | _ ->
    printl "Couldn't get title - unexpected type in metadata"

lwt _ =
  lwt proxy = Mpris_spotify.make_proxy () in

  try_lwt
    lwt () = Spotify.stop proxy in
    lwt () = print_playback_status proxy in
    lwt () = Spotify.open_uri proxy "spotify:track:1R2SZUOGJqqBiLuvwKOT2Y" in
    lwt () = Lwt_unix.sleep 1.0 in
    lwt () = print_playback_status proxy in
    lwt () = print_metadata_title proxy in
    lwt () = Lwt_unix.sleep 5.0 in
    lwt () = Spotify.stop proxy in
    lwt () = Lwt_unix.sleep 1.0 in
    print_playback_status proxy
  with
    | OBus_bus.Name_has_no_owner _
    | OBus_bus.Service_unknown _ ->
      lwt () = printl "Spotify service not found - is it running?" in
      return ()
    | e -> raise_lwt e
