# task-simCorp

## C# implementation

### Requirements
- `.NET`
- `dotnet` 

### Use
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

