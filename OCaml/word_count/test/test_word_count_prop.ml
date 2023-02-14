open QCheck

let prop_count_all_words = 
    Test.make ~count:500 ~name:"Counting words count all words"
    QCheck.(list string)
    (fun file_content -> 
        List.for_all (fun line ->
            let hash_table = Word_count.File.count_words_in_line line (ref (Hashtbl.create 32)) in
            let number_words = Hashtbl.fold (fun _key value acc -> acc + value) hash_table 0 in
            let words = String.split_on_char ' ' line in
            let trimmed_words = List.filter (fun l -> String.length l > 0) (List.map (fun w -> String.trim w) words) in
            let expected_num_words = List.length trimmed_words in
            number_words = expected_num_words
        ) file_content
    )

let () = QCheck_runner.run_tests_main [prop_count_all_words]
