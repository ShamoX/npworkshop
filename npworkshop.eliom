{shared{
  open Eliom_lib
  open Eliom_content
}}

module Npworkshop_app =
  Eliom_registration.App (
    struct
      let application_name = "npworkshop"
    end)

let main_service =
  Eliom_service.service ~path:[] ~get_params:Eliom_parameter.unit ()

let () =
  Npworkshop_app.register
    ~service:main_service
    (fun () () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"npworkshop"
           ~css:[["css";"npworkshop.css"]]
           Html5.F.(body [
             h2 [pcdata "Welcome from Eliom's destillery!"];
           ])))
