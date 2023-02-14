namespace library;
public class WordCounter : Dictionary<string, uint> {

    public void CountWords(string[] lines) {
        if (lines.Count() == 0) return;
        foreach (string line in lines) {
            CountWords(line);
        }
    }

    public void CountWords(IEnumerable<string> fileContent) {
        if (fileContent.Count() == 0) return;
        foreach (string line in fileContent) {
            CountWords(line);
        }

    }

    public void CountWords(string line) {
        if (line.Length == 0) return;
        string[] words = line.Split(" ");
        foreach (string word in words) {
            string trimmedWord = word.Trim();
            if (trimmedWord.Length == 0) continue;
            uint count;
            if (this.TryGetValue(trimmedWord, out count)) {
                this[trimmedWord] = ++count;
            }
            else {
                this.Add(trimmedWord, 1);
            }
        }
    }

    public override string ToString() {
        string result = "";
        foreach (KeyValuePair<string, uint> entry in this) {
            result += entry.Key;
            result += ": ";
            result += entry.Value;
            result += "\n";
        }
        return result;
    }

}
