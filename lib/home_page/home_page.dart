import 'package:flutter/material.dart';
import 'package:nda_proverb_project/home_page/next_page.dart';
import 'package:nda_proverb_project/proverb.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define your list of ProverbBanks here
  List<ProverbBank> proverbBanks = [
    ProverbBank(
      images: [
        ImagePath.jj1,
        ImagePath.jj2,
        ImagePath.jj3,
        ImagePath.jj4,
      ],
      correctAnswer: 'A hunter who has only one arrow does not shoot with careless aim.',
      options: [
        'A hunter who has only one arrow does not shoot with careless aim.',
        'Hold a true friend with both hands.',
        'A child does not die because the mother’s breasts are dry.'],
    ),

    ProverbBank(
      images: [
        ImagePath.aa1,
        ImagePath.aa2,
        ImagePath.aa3,
        ImagePath.aa4
      ],
      correctAnswer: 'When the music changes, so does the dance.',
      options: [
        'Without knowing a person we must not hate him.',
        'Ugliness with a good character is better than beauty.',
        'When the music changes, so does the dance.'
      ],
    ),
    ProverbBank(
      images: [
        ImagePath.bb1,
        ImagePath.bb2,
        ImagePath.bb3,
        ImagePath.bb4
      ],
      correctAnswer: 'That man who has one eye will only thank God if he sees a blind man.',
      options: [
        'That man who has one eye will only thank God if he sees a blind man.',
        'One finger cannot remove lice from the head.',
        'Love is better than a whip.'],
    ),
    ProverbBank(
      images: [
        ImagePath.cc1,
        ImagePath.cc2,
        ImagePath.cc3,
        ImagePath.cc4,
      ],
      correctAnswer: 'You cannot beat a drum with one finger.',
      options: [
        'When the laborer is praised, his cutlass begins to cut more keenly.',
        'What affects the nose must also affect the eyes that must weep for it.',
        'You cannot beat a drum with one finger.'],
    ),
    ProverbBank(
      images: [
        ImagePath.dd1,
        ImagePath.dd2,
        ImagePath.dd3,
        ImagePath.dd4,
      ],
      correctAnswer: 'What an elder saw while sitting, a youth could not see it standing.',
      options: [
        'What an elder saw while sitting, a youth could not see it standing.',
        'Marriage is like groundnut, you have to crack it to see what is inside.',
        'Fowls will not spare a cockroach that falls in their mist.'],
    ),

    ProverbBank(
      images: [
        ImagePath.ee1,
        ImagePath.ee2,
        ImagePath.ee3,
        ImagePath.ee4,
      ],
      correctAnswer: 'The blind man doesn’t need to be told that it’s raining',
      options: [
        'A hunter who has only one arrow does not shoot with careless aim.',
        'A man does not wander far from where his corn is roasting.',
        'The blind man doesn’t need to be told that it’s raining'],
    ),

    ProverbBank(
      images: [
        ImagePath.ff1,
        ImagePath.ff2,
        ImagePath.ff3,
        ImagePath.ff4,
      ],
      correctAnswer: 'When elephants fight, it is the grass that suffers',
      options: [
        'When elephants fight, it is the grass that suffers.',
        'Do not call the forest that shelters you a jungle.',
        'If you offend, ask for a pardon; if offended, forgive.'],
    ),


    ProverbBank(
      images: [
        ImagePath.gg1,
        ImagePath.gg2,
        ImagePath.gg3,
        ImagePath.gg4,
      ],
      correctAnswer: ' Empty Barrels Make the Most Noise',
      options: [
        'He who sleeps with an itchy anus must wake up with smelly fingers.',
        'Empty Barrels Make the Most Noise.',
        'Choose your neighbors before you buy your house.'],
    ),

    ProverbBank(
      images: [
        ImagePath.hh1,
        ImagePath.hh2,
        ImagePath.hh3,
        ImagePath.hh4,
      ],
      correctAnswer: 'No matter how dark it is, the hand always knows the way to the mouth.',
      options: [
        'When the mouse laughs at the cat there is a hole nearby.',
        'If you cannot look ahead, you will always remain behind.',
        'No matter how dark it is, the hand always knows the way to the mouth.'],
    ),

    ProverbBank(
      images: [
        ImagePath.ii1,
        ImagePath.ii2,
        ImagePath.ii3,
        ImagePath.ii4,
      ],
      correctAnswer: 'A fowl does not forget where it lays its eggs.',
      options: [
        'Water may cover the footprint on the ground but it does not cover the words of the mouth.',
        'A fowl does not forget where it lays its eggs.',
        'Until lions have their own historians, accounts of the hunt will always celebrate the hunter.'],
    ),

  ];

  int currentProverbBankIndex = 0;
  int score = 0;
  int missedCount = 0;
  List<String> letters = ['A', 'B', 'C'];

  void checkAnswer(String selectedAnswer) {
    String correctAnswer = proverbBanks[currentProverbBankIndex].correctAnswer;

    setState(() {
      if (selectedAnswer == correctAnswer) {
        score++;
      } else {
        missedCount++;
      }

      // Move to the next ProverbBank
      if (currentProverbBankIndex < proverbBanks.length - 1) {
        currentProverbBankIndex++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('End of Proverb'),
              content: Text(
                'Your score is, Right: $score, Wrong: $missedCount',
              ),
              actions: [
                TextButton(
                  child: const Text('Restart'),
                  onPressed: () {
                    setState(() {
                      currentProverbBankIndex = 0;
                      score = 0;
                      missedCount = 0;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Next'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NextPage()),
                    );
                  },
                ),
              ],
            );
          },
        );


      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proverb'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Row(
              children: [
                Text('Right: $score'),
                const SizedBox(
                  width: 20,
                ),
                Text('Wrong: $missedCount'),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(4, (index) {
                  return Image.asset(
                        proverbBanks[currentProverbBankIndex].images[index]);

                }),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: proverbBanks[currentProverbBankIndex]
                  .options
                  .asMap()
                  .map((index, option) => MapEntry(
                        index,
                        Row(
                          children: [
                            Text(
                              letters[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () => checkAnswer(option),
                              child: Card(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                child: SizedBox(
                                  width: 330,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 8.0),
                                    child: Text(
                                      option,
                                      // softWrap: true,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .values
                  .toList(),
            ),
           const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (currentProverbBankIndex > 0) {
                        currentProverbBankIndex--;
                      }
                    });
                  },
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement logic to go to the next ProverbBank
                    setState(() {
                      if (currentProverbBankIndex < proverbBanks.length - 1) {
                        currentProverbBankIndex++;
                      }
                    });
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProverbBank {
  final List<String> images;
  final String correctAnswer;
  final List<String> options;

  ProverbBank({
    required this.images,
    required this.correctAnswer,
    required this.options,
  });
}
