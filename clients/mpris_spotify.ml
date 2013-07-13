let make_proxy () =
  Mpris_client_common.make_proxy "org.mpris.MediaPlayer2.spotify"

module Org_mpris_MediaPlayer2 = struct
  include Mpris_client_generic.Org_mpris_MediaPlayer2

  let can_set_fullscreen _ =
    Pervasives.raise Mpris_client_common.Not_implemented

  let fullscreen _ =
    Pervasives.raise Mpris_client_common.Not_implemented
end

module Org_mpris_MediaPlayer2_Player =
  Mpris_client_generic.Org_mpris_MediaPlayer2_Player

