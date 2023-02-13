using library;

namespace console_app;
class Program {

    static string[] ParseArguments(string[] args) {
        if (args.Length == 0) {
            Console.Error.WriteLine("Wrong use: word_count [file1, ...]");
            Environment.Exit(1);
        }
        return args;
    }

    static void logWordCounter(WordCounter wc, string title) {
        Console.WriteLine($"--- {title} ---");
        Console.WriteLine(wc);
    }

    static void logTotal(List<WordCounter> wordCounters){
        if(wordCounters.Count <= 1) return;
        WordCounter totalCount = wordCounters[0];
        // TODO: Concatenate all the dictionaries to have the total from
        // all the files
    }

    static void Main(string[] args) {
        string[] filePaths = ParseArguments(args);
        foreach (string filePath in filePaths) {
            try {
                string[] fileContent = File.ReadAllLines(filePath);
                WordCounter wc = new WordCounter();
                wc.CountWords(fileContent);
                logWordCounter(wc, filePath);
            }
            catch (Exception e) {
                Console.Error.WriteLine(e.Message);
            }
        }
    }
}
