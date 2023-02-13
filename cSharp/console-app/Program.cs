namespace console_app;
class Program {

    static string ParseArguments(string[] args) {
        if (args.Length == 0) {
            Console.Error.WriteLine("Wrong use: word_count <file1> <file2> ... <file n>");
            throw new ApplicationException();
        }
        return args[0];
    }

    static void Main(string[] args) {


        // TODO: refactor to the following
        //
        // string[] paths = ParseArguments(args);
        // WordCounter wc = new WordCounter(paths);
        // wc.Count();
        // wc.LogCount();
        //
        string path = ParseArguments(args);
        string[] fileContent = File.ReadAllLines(path);
        Dictionary<string, uint> wordCount = new Dictionary<string, uint>();
        foreach (string line in fileContent) {
            string[] words = line.Split(" ");
            foreach (string word in words) {
                uint count;
                if (wordCount.TryGetValue(word, out count)) {
                    wordCount[word] = ++count;
                }
                else {
                    wordCount.Add(word, 1);
                }
            }
        }
        foreach (var entry in wordCount) {
            Console.WriteLine($"{entry.Key}: {entry.Value}");
        }
    }
}
