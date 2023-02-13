let countOccurences (s: string) (hash_table: (string, int) Hashtbl.t) =
    let words = String.split_on_char ' ' s in
        List.iter (fun x -> match Hashtbl.find hash_table x with
                          | count -> Hashtbl.replace hash_table x count+1
                          | Not_found -> Hashtbl.add hash_table x 1) words
                            
