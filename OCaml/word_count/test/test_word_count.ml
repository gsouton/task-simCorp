open OUnit2

let test_simple _test_ctxt = 
    (* assert_equal 42 42 *)
    let expected_table = Hashtbl.create 32 in
        Hashtbl.add expected_table "Hello" 1;
        Hashtbl.add expected_table "World" 1;

    let table = Word_count.StringUtils.count_words_in_line "Hello World" (ref (Hashtbl.create 32)) in 
    assert_equal table expected_table

let test_empty _test_ctxt =
    let table = Word_count.StringUtils.count_words_in_line "" (ref (Hashtbl.create 32)) in 
    assert_equal (Hashtbl.length table) 0

let suite = "Test suite for word_count" >::: [
    "empty" >:: test_empty;
    "simple" >:: test_simple]

let () = run_test_tt_main suite


