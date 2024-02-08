(*
 	ft_turing _main.ml
 	smiro
	2024-02
*)

type action = Left | Right

type state = string

type transition = {
    read: char;
    write: char;
    to_state: state;
    action: action;
}

type machine = {
    alphabe: string;
    blank: char;
    states: state list;
    finals: state list;
}

let print cur tape =
    String.iteri (fun i c ->
        if i = cur then Printf.printf "[%c]" c
        else
        Printf.printf "%c" c
    ) tape;
    print_endline ""

let () =
    let tape = "Hello, World!" in
    let rec loop cur tape =
        if cur < String.length tape then
            print cur tape;
            loop (cur + 1) tape
    in loop 0 tape

