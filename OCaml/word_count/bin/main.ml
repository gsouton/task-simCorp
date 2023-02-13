

let usage_msg = "word_count <file>"
let input_files = ref []

let anonymous_input filename = input_files := filename :: !input_files
let specification_list = []

let rec read_lines in_channel (hash_table: (string, int) Hashtbl.t ref) =
    try
        let line = input_line in_channel in
            read_lines in_channel (ref (Word_count.StringUtils.count_words_in_line line hash_table))
        with End_of_file ->
            close_in_noerr in_channel;
            hash_table

let rec process_files (file_paths: string list ref) hash_tables =
    let files = !file_paths in
        match files with
        | [] -> hash_tables
        | (file_path::fs) -> 
                let in_channel = open_in file_path in
                    let hash_table = read_lines in_channel (ref (Hashtbl.create 32)) in
                        process_files (ref fs) (hash_table::hash_tables)


let rec log_count (hash_tables: (string, int) Hashtbl.t ref list) =
    match hash_tables with
    | [] -> ()
    | (table::tables) ->
            let t = !table in
                Hashtbl.iter (fun key value -> print_string key; print_string ": "; print_int value; print_endline "";) (t);
                log_count tables

let () = 
    Arg.parse specification_list anonymous_input usage_msg;
    let hash_tables = process_files input_files [] in
        log_count hash_tables


    

    
    (* Opening file [0] *)
    (* let channel = open_in (List.nth !input_files 0) in *)
    (*     let hash_table = Hashtbl.create 32 in *)
    (*         Word_count.StringUtils *)
    (* try *)
    (*     let line = input_line channel in *)
    (*     print_endline line; *)
    (* with e -> *)
    (*     close_in_noerr channel; *)
    (*     raise e *)
