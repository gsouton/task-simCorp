(** Update the counter for a word in a hash table **)
let rec register_words (words_list: string list) (hash_table: (string, int) Hashtbl.t ref) =
    let h = !hash_table in
        match words_list with
        | [] -> h
        | (word::words) -> let w = String.trim word in
                           if String.length w == 0
                           then register_words words hash_table
                           else try
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


let rec count_words_in_file in_channel (hash_table: (string, int) Hashtbl.t ref) =
    try
        let line = input_line in_channel in
            count_words_in_file in_channel (ref (count_words_in_line line hash_table))
        with End_of_file ->
            close_in_noerr in_channel;
            hash_table

let count_words in_channel =
    let hash_table = ref (Hashtbl.create 32) in
        !(count_words_in_file in_channel hash_table)
        


