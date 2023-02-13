namespace test_library;
using library;

public class WordCounterTests {
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

}
