open Hashtbl
open Marshal

let texts = Hashtbl.create ~random:true 2
and dlg = ref None;; (* default lang *)


let load lg =
  try begin
    let ic = open_in (String.concat "" ["static/locales/"; lg; ".hsh"]) in
    Hashtbl.add texts lg (Marshal.from_channel ic);
    close_in ic;
    (if !dlg = None then dlg := Some(lg));
    true
  end with _ -> false
;;

let set_default lg =
  dlg := Some(lg)
;;


let gt ?lg (id : string) =
  match !dlg with
    None -> id
  | Some(dlg) -> begin
    match lg with
    None -> begin
      try Hashtbl.find (Hashtbl.find texts dlg) id with Not_found -> id
    end
    | Some(lg) -> try
        Hashtbl.find (Hashtbl.find texts lg) id
    with Not_found -> begin
      try Hashtbl.find (Hashtbl.find texts dlg) id with Not_found -> id
    end
  end
;;
