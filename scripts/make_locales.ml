open Marshal
open Hashtbl



(* 'en' attempts *)
let en = create ~random:true 10;;
add en "login.head" "Welcome to Newspaper Workshop";
add en "login.title" "Please log in below..."
;;




(* write table *)
let oc = open_out "static/locales/en.hsh" in
to_channel oc en [Closures];
  close_out oc
;;
