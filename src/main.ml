(*
 	ft_turing _main.ml
 	smiro
	2024-02
*)

(* let states = Map (state, char), (state, char, action) *)
(* let next_state s c -> (to_state, write, action) *)

let print (cur, tape) =
    String.iteri (fun i c ->
        if i = cur then Printf.printf "\x1b[38;5;196m%c\x1b[0m" c
        else
        Printf.printf "%c" c
    ) tape

let rec machine t tape =
    print_endline ""

let () =
    let tape = "111-11=" in
    let transition = State.empty
    |> State.add ("scanright", '.') ("scanright", '.', Action.Right)
    |> State.add ("scanright", '1') ("scanright", '1', Action.Right)
    |> State.add ("scanright", '-') ("scanright", '-', Action.Right)
    |> State.add ("scanright", '=') ("eraseone", '=', Action.Left)
    |> State.add ("eraseone", '1') ("subone", '=', Action.Left)
    |> State.add ("eraseone", '-') ("HALT", '.', Action.Left)
    |> State.add ("subone", '1') ("subone", '.', Action.Left)
    |> State.add ("subone", '-') ("skip", '.', Action.Left)
    |> State.add ("skip", '.') ("skip", '.', Action.Left)
    |> State.add ("skip", '1') ("scanright", '.', Action.Right) in
        machine transition tape
