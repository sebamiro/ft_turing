(*
 	ft_turing _state.mli
 	smiro
	2024-02
*)

module T = struct
    type t = string * char
        let compare (s1, c1) (s2, c2) = String.compare s1 s2
end

include T
include Map.Make(T)
