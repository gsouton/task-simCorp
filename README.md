# Task
Write a program (and prove that it works, we expect you to write automated tests) that: Given a text file, count the occurrence of each unique word in the file.

For example; a file containing the string “Go do that thing that you do so well” should find these counts:

1: Go

2: do

2: that

1: thing

1: you

1: so

1: well

## Implementation
This repository contains two implementation for the task, one in `OCaml` and the
other in `C#`.

Both implementations at the end provides an executable allowing you to count
words in files 

`word-count [file..]` 


## OCaml implementation

### Requirements
- `opam`
- `dune` 
- `OUnit` 

### Usage

#### Build
To build the project using dune in the directory `OCaml/word_count`: 
- `dune build`

#### Test
To run the tests: 
- `dune runtest` or with the alias `dune test`

#### Run
To execute the program:
- `dune exec word_count ../../examples/ex1`

You can also use the build
- `./_build/install/default/bin/word_count <argument>`

## C# implementation

### Requirements
- `.NET`
- `dotnet` 

### Usage
#### Build
In the CSharp directory, you can build the project:
- `dotnet build`

To have a release version you can also build using 
- `dotnet build --configuration Release`

#### Test
To run the tests:
- `dotnet test test-library/test-library.csproj`

#### Run
To run the project using the `dotnet` cli :
- `dotnet run --project console-app ../examples/ex1`
- `dotnet run --project console-app ../examples/ex1 ../examples/ex2`

It is also possible to use the executable created by the build directly
- `console-app/bin/Debug/net[X.X]/console-app ../examples/ex1`
