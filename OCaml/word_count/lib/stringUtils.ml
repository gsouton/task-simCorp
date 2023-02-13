let rec register_words (words_list: string list) (hash_table: (string, int) Hashtbl.t ref) =
    let h = !hash_table in
        match words_list with
        | [] -> h
        | (word::words) -> try
                                let count = Hashtbl.find h word in
                                    Hashtbl.replace h word (count+1);
                                    register_words words hash_table
                           with Not_found ->
                               Hashtbl.add h word 1;
                               register_words words hash_table

let count_words_in_line line (hash_table: (string, int) Hashtbl.t ref) =
    if String.length line = 0 
    then !hash_table
    else let words = String.split_on_char ' ' line in register_words words hash_table
