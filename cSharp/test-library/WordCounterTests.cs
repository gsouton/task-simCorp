namespace test_library;
using library;

public class WordCounterTests {

    private string example1 = "../../../../../examples/ex1";
    private string example2 = "../../../../../examples/ex2";
    private string example3 = "../../../../../examples/ex3";
    private string example4 = "../../../../../examples/ex4";
    private string example5 = "../../../../../examples/ex5";

    [Theory]
    [InlineData("")]
    public void EmptyString(string line) {
        WordCounter wc = new WordCounter();
        wc.CountWords(line);
        Assert.True(wc.Count == 0);
    }

    [Fact]
    public void EmptyFile() {
        WordCounter wc = new WordCounter();
        string[] fileContent = new string[] { "", "", "", "" };
        wc.CountWords(fileContent);
        Assert.True(wc.Count == 0);
    }

   [Fact]
    public void CountOneLine() {
        String line = "Hello World Good Bye World";
        Dictionary<string, uint> expected = new Dictionary<string, uint>();
        expected.Add("Hello", 1);
        expected.Add("World", 2);
        expected.Add("Good", 1);
        expected.Add("Bye", 1);

        WordCounter wc = new WordCounter();
        wc.CountWords(line);

        Assert.Equal(expected, wc);
    }

    [Fact]
    public void CountTwoLines() {
        string line = "Hello World Good Bye World";
        string[] lines = new string[] { line, line };
        Dictionary<string, uint> expected = new Dictionary<string, uint>();
        expected.Add("Hello", 2);
        expected.Add("World", 4);
        expected.Add("Good", 2);
        expected.Add("Bye", 2);

        WordCounter wc = new WordCounter();
        wc.CountWords(lines);

        Assert.Equal(expected, wc);
    }

    [Fact]
    public void Example1(){
        IEnumerable<string> fileContent = File.ReadLines(example1);
        WordCounter wc = new WordCounter();
        wc.CountWords(fileContent);

        Dictionary<string, uint> expected = new Dictionary<string, uint>();

        expected.Add("Go", 1);
        expected.Add("do", 2);
        expected.Add("that", 2);
        expected.Add("thing", 1);
        expected.Add("you", 1);
        expected.Add("so", 1);
        expected.Add("well", 1);

        Assert.Equal(expected, wc);
    }

    [Fact]
    public void Example2(){
        IEnumerable<string> fileContent = File.ReadLines(example2);
        WordCounter wc = new WordCounter();
        wc.CountWords(fileContent);

        Dictionary<string, uint> expected = new Dictionary<string, uint>();
        expected.Add("about", 1);
        expected.Add("are", 1);
        expected.Add("cruel", 2);
        expected.Add("end", 1);
        expected.Add("Goodbye", 1);
        expected.Add("Hello", 1);
        expected.Add("is", 1);
        expected.Add("life", 1);
        expected.Add("My", 1);
        expected.Add("so", 1);
        expected.Add("soon", 1);
        expected.Add("to", 1);
        expected.Add("why", 1);
        expected.Add("world", 2);
        expected.Add("you", 1);
        expected.Add("?", 1);

        Assert.Equal(expected, wc);
    }


    [Fact]
    public void Example3(){
        IEnumerable<string> fileContent = File.ReadLines(example3);
        WordCounter wc = new WordCounter();
        wc.CountWords(fileContent);
        Assert.Equal(wc.Count(), 0);
    }

    [Fact]
    public void Example4(){
        IEnumerable<string> fileContent = File.ReadLines(example4);
        WordCounter wc = new WordCounter();
        wc.CountWords(fileContent);
        Assert.Equal(wc.Count(), 0);
    }

    [Fact]
    public void Example5(){
        IEnumerable<string> fileContent = File.ReadLines(example5);
        WordCounter wc = new WordCounter();
        wc.CountWords(fileContent);

        Dictionary<string, uint> expected = new Dictionary<string, uint>();
        expected.Add("H", 1);

        Assert.Equal(expected, wc);
    }

}
