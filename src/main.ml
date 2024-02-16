
(*
 	ft_turing _main.ml
 	smiro
	2024-02
*)

(* let states = Map (state, char), (state, char, action) *)
(* let next_state s c -> (to_state, write, action) *)

let print (cur, tape) =
    print_string "[";
    String.iteri (fun i c ->
        if i = cur then Printf.printf "<\x1b[38;5;196m%c\x1b[0m>" c
        else
        Printf.printf "%c" c
    ) tape;
    print_string "] "

let rec machine t state tape cur =
    print (cur, tape);
    Printf.printf "(%s, %c) -> " state tape.[cur];
    match t |> State.find_opt (state, tape.[cur]) with
    | None -> Printf.printf "HALT\n"
    | Some((to_state, write, action)) ->
            Printf.printf "(%s, %c, %s)\n" to_state write (match action with Action.Left -> "Left" | Action.Right -> "Right");
            machine t to_state
                (String.mapi (fun i c -> if i = cur then write else c) tape)
                (cur + match action with
                | Action.Left -> -1
                | Action.Right -> 1
            )


open Core ;;
open Yojson;;

let () =
        (*
    let tape = "11111-1111=" in
    let transition = State.empty
    |> State.add ("scanright", '.') ("scanright", '.', Action.Right)
    |> State.add ("scanright", '1') ("scanright", '1', Action.Right)
    |> State.add ("scanright", '-') ("scanright", '-', Action.Right)
    |> State.add ("scanright", '=') ("eraseone", '.', Action.Left)
    |> State.add ("eraseone", '1') ("subone", '=', Action.Left)
    |> State.add ("eraseone", '-') ("HALT", '.', Action.Left)
    |> State.add ("subone", '1') ("subone", '1', Action.Left)
    |> State.add ("subone", '-') ("skip", '-', Action.Left)
    |> State.add ("skip", '.') ("skip", '.', Action.Left)
    |> State.add ("skip", '1') ("scanright", '.', Action.Right) in
        machine transition "scanright" tape 0
*)

    let json_content = Yojson.Basic.from_file "unary_sub.json" in
    print_endline (Yojson.Basic.pretty_to_string json_content)
