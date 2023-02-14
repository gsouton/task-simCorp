open OUnit2

let example1 = "../../../../../examples/ex1"
let example2 = "../../../../../examples/ex2"
let example3 = "../../../../../examples/ex3"
let example4 = "../../../../../examples/ex4"
let example5 = "../../../../../examples/ex5"

let test_simple _test_ctxt = 
    let expected_table = Hashtbl.create 32 in
        Hashtbl.add expected_table "Hello" 1;
        Hashtbl.add expected_table "World" 1;

        let table = Word_count.StringUtils.count_words_in_line "Hello World" (ref (Hashtbl.create 32)) in 
        assert_equal table expected_table

let test_whitespace _test_ctxt = 
    let table = Word_count.StringUtils.count_words_in_line "               " (ref (Hashtbl.create 32)) in 
    assert_equal 0 (Hashtbl.length table)

let test_whitespace_around_word _test_ctxt = 
    let table = Word_count.StringUtils.count_words_in_line "       Hello         " (ref (Hashtbl.create 32)) in 
        let expected_table = Hashtbl.create 32 in
            Hashtbl.add expected_table "Hello" 1;

    assert_equal expected_table table

let test_empty _test_ctxt =
    let table = Word_count.StringUtils.count_words_in_line "" (ref (Hashtbl.create 32)) in 
    assert_equal (Hashtbl.length table) 0

let test_example1 _text_ctxt =
    let expected_table = Hashtbl.create 32 in
        Hashtbl.add expected_table "Go" 1;
        Hashtbl.add expected_table "do" 2;
        Hashtbl.add expected_table "that" 2;
        Hashtbl.add expected_table "thing" 1;
        Hashtbl.add expected_table "you" 1;
        Hashtbl.add expected_table "so" 1;
        Hashtbl.add expected_table "well" 1;
        
        let in_channel = open_in example1 in
            assert_equal expected_table (Word_count.StringUtils.count_words in_channel)

let test_example2 _text_ctxt =
    let expected_table = Hashtbl.create 32 in
        Hashtbl.add expected_table "about" 1;
        Hashtbl.add expected_table "are" 1;
        Hashtbl.add expected_table "cruel" 2;
        Hashtbl.add expected_table "end" 1;
        Hashtbl.add expected_table "Goodbye" 1;
        Hashtbl.add expected_table "Hello" 1;
        Hashtbl.add expected_table "is" 1;
        Hashtbl.add expected_table "life" 1;
        Hashtbl.add expected_table "My" 1;
        Hashtbl.add expected_table "so" 1;
        Hashtbl.add expected_table "soon" 1;
        Hashtbl.add expected_table "to" 1;
        Hashtbl.add expected_table "why" 1;
        Hashtbl.add expected_table "world" 2;
        Hashtbl.add expected_table "you" 1;
        Hashtbl.add expected_table "?" 1;
        let in_channel = open_in example2 in
            assert_equal expected_table (Word_count.StringUtils.count_words in_channel)

let empty_file _test_ctxt =
    let in_channel = open_in example3 in
        let table = (Word_count.StringUtils.count_words in_channel) in
            assert_equal 0 (Hashtbl.length table)

let empty_file2 _test_ctxt =
    let in_channel = open_in example4 in
        let table = (Word_count.StringUtils.count_words in_channel) in
            assert_equal 0 (Hashtbl.length table)
    

let example5 _test_ctxt =
    let in_channel = open_in example5 in
        let table = (Word_count.StringUtils.count_words in_channel) in
            let expected_table = Hashtbl.create 32 in
                Hashtbl.add expected_table "H" 1;
                
                assert_equal expected_table table


let suite = "Test suite for word_count" >::: [
    "empty" >:: test_empty;
    "simple" >:: test_simple;
    "whitespace" >:: test_whitespace;
    "whitespace around word" >:: test_whitespace_around_word;
    "test_example1" >:: test_example1;
    "test_example2" >:: test_example2;
    "test_empty_file" >:: empty_file;
    "test_empty_file2" >:: empty_file2;
    "example5" >:: example5]

let () = run_test_tt_main suite


