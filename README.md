# 🌪️ Cyclone: The World's Slowest CPU Satoshi Puzzle Solver
(Because sometimes slow and steady... is just slow.)

## 🎮 The Tale of the Lazy Developer

Once upon a time, in a land of infinite coffee and Stack Overflow answers, there was a developer named Bob.

Bob loved to copy-paste code from GitHub, believing it was the ultimate life hack.  

One day, he found a repo titled "World's Fastest Satoshi Solver" and thought, "This is it! My ticket to fame!"

Without reading the README (because who does that?), Bob copied the code and pasted it into his project.

The code compiled, but instead of solving puzzles, it printed, "Hello, world!" over and over.

Bob scratched his head and thought, "Maybe I need to tweak it. Let me copy-paste again."

This time, the code made his computer play "Never Gonna Give You Up" on loop.

Bob sighed, "I've been Rickrolled by my own code."

Determined, Bob went back to GitHub and found another repo: "AI-Powered Toaster."

He copied the code, pasted it, and ran it. His toaster started tweeting random memes.

Bob's roommate walked in, saw the toaster, and said, "Dude, your toaster is funnier than you."

Frustrated, Bob decided to write his own code. He opened a new file and typed: `print("Hello, world!")`.

But then he thought, "Why reinvent the wheel?" and copied it from an old project instead.

The code worked, but Bob felt empty inside. "Is this all there is to programming?" he wondered.

One night, Bob dreamt of a magical GitHub repo that could solve all his problems.

In his dream, he copied the code, but it demanded a sacrifice: his coffee mug.

Bob woke up in a cold sweat, clutching his mug tightly. "Never!" he declared.

The next day, Bob decided to actually read the README files. It was a revolutionary moment.

He learned how the code worked, fixed his project, and even contributed to a repo.

From that day on, Bob still copy-pasted code, but he did it responsibly—and kept his coffee mug safe.

**Moral of the story:** Always read the README, and never trust a toaster that tweets memes.

---

## 🚀 Usage

Cyclone is your go-to tool for solving Satoshi puzzles, whether you're feeling lucky or just really patient. Here's how to use it:

```bash
./Cyclone -h <hash160_hex> [-p <puzzle> | -r <startHex:endHex> | -f <range_file>] -b <prefix_length> [-R | -S] [-t <threads>]
```
The program is designed to search for a specific Bitcoin address (Hash160) within a given range of private keys. It supports both sequential and random search modes, and can utilize multiple CPU threads for faster computation.

### 📌 Required Arguments

- `-h <hash160_hex>`: Specifies the target Hash160 value in hexadecimal format. This is the Bitcoin address you are searching for.

### 🎮 Optional Arguments

- `-p <puzzle>`: Specifies the puzzle number. The program will search within the range `[2^(puzzle-1), 2^puzzle - 1]`.
- `-r <startHex:endHex>`: Specifies a custom range of private keys to search within, in hexadecimal format.
- `-f <range_file>`: Specifies a file containing a list of ranges to search. Each line in the file should be in the format `startHex:endHex`.
- `-b <prefix_length>`: Specifies the prefix length for partial matches. Must be between **1 and 20** (because prefixes matter).
- `-R`: Enables **random search mode**. The program will randomly generate private keys within the specified range. (Chaos is life.)
- `-S`: Enables **sequential search mode** (default). The program will sequentially search through the specified range. (For those who like order in their chaos.)
- `-t <threads>`: Specifies the number of CPU threads to use. Defaults to the number of available CPU cores. (Because why not?)

---

## 🎲 Examples

### Example 1: Searching within a Puzzle Range

```bash
./Cyclone -h 1234567890abcdef1234567890abcdef12345678 -p 66 -b 4 -t 8
```

This command searches for the Hash160 `1234567890abcdef1234567890abcdef12345678` within the range `[2^65, 2^66 - 1]`. It uses **8 CPU threads** and checks for partial matches with a prefix length of **4**.

---

### Example 2: Searching within a Custom Range

```bash
./Cyclone -h 1234567890abcdef1234567890abcdef12345678 -r 8000000000000000:ffffffffffffffff -b 6 -S
```

This command searches for the Hash160 `1234567890abcdef1234567890abcdef12345678` within the custom range `8000000000000000:ffffffffffffffff`. It uses **sequential search mode** and checks for partial matches with a prefix length of **6**.

---

### File-Based Blitzkrieg

```bash
./Cyclone -h 1234567890abcdef1234567890abcdef12345678 -f ranges.txt -b 8 -R -t 16
```

This command searches for the Hash160 `1234567890abcdef1234567890abcdef12345678` within the ranges specified in `ranges.txt`. It uses **random search mode**, **16 CPU threads**, and checks for partial matches with a prefix length of **8**.

Each line in the file should represent a single range in the format:
startHex:endHex
where startHex and endHex are hexadecimal values representing the start and end of the range, respectively.

Ranges must be separated by a newline.

Example of a Valid Ranges File (ranges.txt):
```bash
8000000000000000:ffffffffffffffff
20000000000000000:3ffffffffffffffff
800000000000000000:ffffffffffffffffff
```
Explanation:

Line 1: Searches from 8000000000000000 to ffffffffffffffff.

Line 2: Searches from 20000000000000000 to 3ffffffffffffffff.

Line 3: Searches from 800000000000000000 to ffffffffffffffffff.

⚠️ Important Notes:

Ensure there are no spaces or extra characters in the file.

Each range must be on a new line.

The file should not contain any headers or comments.

---

## 📊 Mission Control: Output Details

The program outputs the following information:

**Status Block**:
Displays the current status of the search, including:
- Target Hash160 ✅
- Search range 📏
- CPU threads 🧠
- Speedometer (Mkeys/s) 🚀
- Total keys checked 💲
- Elapsed time ⏳
- Progress % 📈

**Partial Matches**:
If a partial match is found, the program will display:
- Private Key 🔑
- Public Key 🛁
- Found Hash160 🧨
- Target Hash160 🎯
- Matched Bytes 💥

**Full Match**: If a full match is found, the program will display:
FULL MATCH! 🚨 PRIVATE KEY FOUND! ✅ Auto-saved to KEYFOUND.txt

---

## 🛠️ Progress Saving

The program periodically saves the progress to `progress.txt`. This file contains the **current state of each thread**, including the **last checked private key, total keys checked, elapsed time, and speed**.

---

## 🧐 Pro Tips

- **Random Mode**: Perfect for when you want to feel like a hacker in a movie. Just mash the keyboard and hope for the best.
- **Sequential Mode**: Ideal for when you have time to spare and want to watch your CPU sweat.
- **Coffee**: Highly recommended while running Cyclone. Your CPU will need the moral support.
- **Patience**: If you're using Sequential Mode, bring a book. Or two. Or maybe a Netflix subscription.

---

## ⚠️ Disclaimer

Cyclone is **not responsible** for melted CPUs, existential crises, or the sudden urge to buy more coffee.

If your computer starts making strange noises, it's probably just Cyclone working its magic. Or your CPU crying.


---

## 🎉 Now Go Forth and Solve Those Puzzles!

Whether you're in it for the thrill or just really bored, Cyclone is here to make your Satoshi puzzle-solving journey... **interesting.**

Remember: **Always read the README, and never trust a toaster that tweets memes.**

## ✌️**TIPS**
BTC: bc1qdwnxr7s08xwelpjy3cc52rrxg63xsmagv50fa8
