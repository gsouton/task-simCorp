Arg=../examples/ex1

all: build

build:
	dotnet build

cli:
	dotnet run --project console-app $(Arg)

test:
	dotnet test test-library/test-library.csproj

clean:
	dotnet clean

