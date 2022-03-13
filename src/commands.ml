type command_phrase = string list

type command =
  | Add
  | Delete of command_phrase
  | View
  | Quit
  | Update of command_phrase

exception Malformed

let parse str =
  let get_command = function
    | [ "add" ] -> Add
    | "delete" :: t -> Delete t
    | [ "view" ] -> View
    | [ "quit" ] -> Quit
    | "update" :: t -> Update t
    | _ -> raise Malformed
  in
  get_command
    (List.filter (fun x -> x <> "") (String.split_on_char ' ' str))