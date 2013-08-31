{shared{
  open Eliom_lib
  open Eliom_content
}}
open Eliom_content.Html5.D (* provides functions to create HTML nodes *)
open I18n

module Npworkshop_app =
  Eliom_registration.App (
    struct
      let application_name = "npworkshop"
    end)

let main_service =
  Eliom_service.service ~path:[] ~get_params:Eliom_parameter.unit ()

let () =
	print_string "Load language en : ";
	if I18n.load "en" then print_endline "OK." else print_endline "NOK.";
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


let main_service =
  Eliom_registration.Html5.register_service
    ~path:["login"]
    ~get_params:Eliom_parameter.unit
    (fun () () ->
      Lwt.return
        (html
           (head (title (pcdata (I18n.gt "login.head"))) [])
           (body [h1 [pcdata (I18n.gt "login.title")]])))
