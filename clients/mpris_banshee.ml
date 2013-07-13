let make_proxy () =
  Mpris_proxy.make "org.mpris.MediaPlayer2.banshee"

module Org_mpris_MediaPlayer2 =
  Mpris_client.Org_mpris_MediaPlayer2

module Org_mpris_MediaPlayer2_Player =
  Mpris_client.Org_mpris_MediaPlayer2_Player
