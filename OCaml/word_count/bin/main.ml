let usage_msg = "word_count <file>"
let input_files = ref []

let anonymous_input filename = input_files := filename :: !input_files
let specification_list = []

(* let rec debug_input_files (files: string list ref) = *)
(*     match !files with *)
(*     | [] -> () *)
(*     | x::xs -> print_endline x; debug_input_files (ref xs) *)


let () = 
    Arg.parse specification_list anonymous_input usage_msg;
    (* Opening file [0] *)
    let channel = open_in (List.nth !input_files 0) in
    try
        let line = input_line channel in
        print_endline line;
    with e ->
        close_in_noerr channel;
        raise e
