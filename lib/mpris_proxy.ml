let make bus_name =
  lwt bus = OBus_bus.session () in
  Lwt.return (OBus_proxy.make
    (OBus_peer.make bus bus_name)
    ["org"; "mpris"; "MediaPlayer2"])
