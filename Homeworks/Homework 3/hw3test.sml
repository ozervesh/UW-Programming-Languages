use "hw3.sml";

val only_capitals_test1 = only_capitals ["A","B","C"] = ["A","B","C"]
val only_capitals_test2 = only_capitals ["a", "B", "c"] = ["B"]

val longest_string1_test1 = longest_string1 ["A","bc","C"] = "bc"
val longest_string1_test2 = longest_string1 ["A","bc","cb"] = "bc"

val longest_string2_test1 = longest_string2 ["A","bc","C"] = "bc"
val longest_string2_test2 = longest_string2 ["A","bc","cb"] = "cb"

val longest_string3_test1 = longest_string3 ["A","bc","C"] = "bc"
val longest_string3_test2 = longest_string3 ["A","bc","cb"] = "bc"

val longest_string4_test1 = longest_string4 ["A","bc","C"] = "bc"
val longest_string4_test2 = longest_string4 ["A","bc","cb"] = "cb"

val longest_capitalized_test1 = longest_capitalized ["A","bc","C"] = "A"
val longest_capitalized_test2 = longest_capitalized ["A","bc","CC"] = "CC"

val rev_string_test1 = rev_string "abc" = "cba"
val rev_string_test2 = rev_string "rotator" = "rotator"
val rev_string_test3 = rev_string "superman" = "namrepus"

val first_answer_test1 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val all_answers_test1 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val all_answers_test2 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []
val all_answers_test3 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [1,2,3,4,5,6,7] = NONE
val all_answers_test4 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [1,1,1,1] = SOME [1,1,1,1]
val all_answers_test5 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,1,1,1] = NONE

val count_wildcards_test1 = count_wildcards Wildcard = 1
val count_wildcards_test2 = count_wildcards (TupleP [Wildcard, Wildcard, Wildcard]) = 3
val count_wildcards_test3 = count_wildcards (ConstructorP ("Dog", Wildcard)) = 1
val count_wildcards_test4 = count_wildcards (ConstructorP ("Spot", Variable "Dog")) = 0

val count_wild_and_variable_lengths_test1 = count_wild_and_variable_lengths (Variable "a") = 1
val count_wild_and_variable_lengths_test2 = count_wild_and_variable_lengths (TupleP [Wildcard, Variable "a"]) = 2

val count_some_var_test1 = count_some_var ("x", Variable("x")) = 1
val count_some_var_test2 = count_some_var ("x", TupleP [Variable "x", Variable "x"]) = 2
val count_some_var_test3 = count_some_var ("x", ConstructorP ("x", Wildcard)) = 0
val count_some_var_test4 = count_some_var ("x", ConstructorP ("x", Variable "x")) = 1

val check_pat_test1 = check_pat (Variable("x")) = true
val check_pat_test2 = check_pat (TupleP [Variable "x", Variable "x"]) = false
val check_pat_test3 = check_pat (TupleP [Variable "x", Variable "s"]) = true

val match_test1 = match (Const(1), UnitP) = NONE
val match_test2 = match (Unit, UnitP) = SOME []
val match_test3 = match (Const 3, ConstP 3) = SOME []
val match_test4 = match (Constructor ("SOME", Const 1), ConstructorP ("SOM", Variable "a")) = NONE
val match_test5 = match (Tuple [Const 5, Constructor ("SOME", Const 1)],
                         TupleP [ConstP 5, ConstructorP ("SOME", Variable "a")])
                = SOME [("a", Const 1)]
val match_test6 = match (Tuple [Const 5, Constructor ("SOME", Const 1)],
                         TupleP [Variable "b", ConstructorP ("SOME", Variable "a")])
                = SOME [("b", Const 5),("a", Const 1)]
val match_test7 = match (Tuple [Const 5, Constructor ("foo", Unit)], TupleP [Wildcard, Wildcard])
                = SOME []
val match_test8 = match (Tuple [Const 5, Constructor ("foo", Unit)], TupleP [Wildcard])
                = NONE
val match_test9 = match (Tuple [Const 5, Constructor ("foo", Unit)], TupleP [ConstP 5, UnitP])
                = NONE
val match_test10 = match (Tuple [Const 17, Unit, Const 4, Constructor ("egg",Const 4),Constructor ("egg",Constructor ("egg",Const 4))],
                    TupleP [Wildcard,Wildcard])
                = NONE

val first_match_test1 = first_match Unit [UnitP] = SOME []
val first_match_test2 = first_match (Const 5) [TupleP [ConstP 5, UnitP]] = NONE
val first_match_test3 = first_match (Const 5) [Variable "a", TupleP [Variable "a", UnitP]] = SOME [("a", Const 5)]
