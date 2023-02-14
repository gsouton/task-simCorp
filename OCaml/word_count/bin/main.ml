let usage_msg = "word_count [file...]"
let input_files = ref []

(** For parsing CLi see: https://ocaml.org/docs/cli-arguments**)
let anonymous_input filename = input_files := filename :: !input_files
let specification_list = []


(** Process to count words in each file returns a list of hash tables **)
let rec process_files (file_paths: string list ref) hash_tables =
    let files = !file_paths in
        match files with
        | [] -> hash_tables
        | (file_path::fs) -> 
                let in_channel = open_in file_path in
                    let hash_table = Word_count.File.count_words in_channel in
                        process_files (ref fs) ((file_path, hash_table)::hash_tables)


(** Log to the console the hash table **)
let rec log_count hash_tables =
    match hash_tables with
    | [] -> ()
    | ((file_path,table)::tables) ->
            let t = table in
                print_string "--- ";
                print_string file_path;
                print_endline " ---";
                Hashtbl.iter (fun key value -> print_string key; print_string ": "; print_int value; print_endline "";) (t);
                log_count tables

let () = 
    Arg.parse specification_list anonymous_input usage_msg;
    let hash_tables = process_files input_files [] in
        log_count hash_tables
