

(** {2 loading function of the languages} *)

val load : string -> bool
  (** [I18n.load lg] loads the file "static/locales/[lg].hsh" with marshal
      module as a string (string, string) Hashtbl.t. The first load will
      also set this language as the default one. *)

(** {2 miscaelus function } *)

val set_default : string -> unit
  (** [I18n.set_default lg] sets the default and fallback language to [lg]. *)

(** {2 The translation function } *)

val gt : ?lg:string -> string -> string
  (** [I18n.gt ?lg id] get the corresponding text to [id]. If you don't specify
      [lg] it is took in the default language. If [id] is not found in the
      [lg] hash table, it is fetch in the default hash table. If it is still
      not found, then [id] is returned.
      This is a straight forwar function: no other treatment is made on the
      resulting string. *)
