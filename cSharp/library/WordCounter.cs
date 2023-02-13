namespace library;
public class WordCounter : Dictionary<string, uint> {

    public void CountWords(string[] lines){
        foreach(string line in lines){
            CountWords(line);
        }
    }

    public void CountWords(string line) {
        if(line.Length == 0) return;
        string[] words = line.Split(" ");
        foreach (string word in words) {
            uint count;
            if (this.TryGetValue(word, out count)) {
                this[word] = ++count;
            }
            else {
                this.Add(word, 1);
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
