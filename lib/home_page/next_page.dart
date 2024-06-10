import 'package:flutter/material.dart';
import 'package:nda_proverb_project/proverb.dart';


class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  // Define your list of ProverbBanks here
  List<ProverbBank> proverbBanks = [
    ProverbBank(
      images: [
        ImagePath.j1,
        ImagePath.j2,
        ImagePath.j3,
        ImagePath.j4,
      ],
      correctAnswer: 'The Gold that will shine would go through fire',
      options: [
        'The Gold that will shine would go through fire',
        'The person light shines on think he alone is brigthen by the sun',
        'A person that got beaten by rain but wasn’t struck by lightning should be thankful'],
    ),

    ProverbBank(
      images: [
        ImagePath.a1,
        ImagePath.a2,
        ImagePath.a3,
        ImagePath.a4
      ],
      correctAnswer: 'The insects that eat up vegetables are always located within its premises',
      options: [
        'The insects that eat up vegetables are always located within its premises',
        'There is no smoke without fire, and no pest without a source',
        'As you sow, so shall you reap'
      ],
    ),
    ProverbBank(
      images: [
        ImagePath.b1,
        ImagePath.b2,
        ImagePath.b3,
        ImagePath.b4
      ],
      correctAnswer: 'When a king’s palace burns down, a rebuilt one turns out to be more attractive',
      options: [
        'Uneasy lies the head that wears a crown',
        'When a king’s palace burns down, a rebuilt one turns out to be more attractive',
        'All that glitters is not gold, and not every palace is a home'],
    ),
    ProverbBank(
      images: [
        ImagePath.c1,
        ImagePath.c2,
        ImagePath.c3,
        ImagePath.c4,
      ],
      correctAnswer: 'A person that got beaten by rain but wasn’t struck by lightning should be thankful',
      options: [
        'The darkest storms bring the brightest bolts; in the rain dance, lightning exults.',
        'Lightning never strikes the same place twice',
        'A person that got beaten by rain but wasn’t struck by lightning should be thankful'],
    ),
    ProverbBank(
      images: [
        ImagePath.d1,
        ImagePath.d2,
        ImagePath.d3,
        ImagePath.d4,
      ],
      correctAnswer: 'A child abuses iroko tree and looks back thinking evil spirit doesn’t kill immediately',
      options: [
        'A child is like a young tree; nurture it well, and it will grow strong and true.',
        'A child abuses iroko tree and looks back thinking evil spirit doesn’t kill immediately',
        'As the tree is known by its fruit, so is a child known by their actions'],
    ),

    ProverbBank(
      images: [
        ImagePath.e1,
        ImagePath.e2,
        ImagePath.e3,
        ImagePath.e4,
      ],
      correctAnswer: 'A bird that compares itself to vultures will end up getting roasted at the fireplace',
      options: [
        'Like a bird that finds warmth in the fire, a wise person seeks comfort in challenges.',
        'Just as a bird needs the warmth of the sun, a fire needs the fuel of care to keep burning',
        'A bird that compares itself to vultures will end up getting roasted at the fireplace'],
    ),

    ProverbBank(
      images: [
        ImagePath.f1,
        ImagePath.f2,
        ImagePath.f3,
        ImagePath.f4,
      ],
      correctAnswer: 'Snails and dogs may have different paces at running but even though the snail is slower, it will also be able to get to its destination',
      options: [
        'As slow as a snails pace, yet loyal as a dogs embrace.',
        'Snails and dogs may have different paces at running but even though the snail is slower, it will also be able to get to its destination',
        'In patience, a snail; in loyalty, a dog – the virtues of a steadfast journey'],
    ),


    ProverbBank(
      images: [
        ImagePath.g1,
        ImagePath.g2,
        ImagePath.g3,
        ImagePath.g4,
      ],
      correctAnswer: 'It is because of the feathers of chickens that we don’t see when they sweat',
      options: [
        'It is because of the feathers of chickens that we don’t see when they sweat',
        'Dont count your chickens before they hatch.',
        'Running around like a headless chicken'],
    ),

    ProverbBank(
      images: [
        ImagePath.h1,
        ImagePath.h2,
        ImagePath.h3,
        ImagePath.h4,
      ],
      correctAnswer: 'A stray dog does not hear the whisper of a hunter or anyone willing to find it because it is destined to get lost',
      options: [
        'Let sleeping dogs lie, especially when the hunter is near.',
        'Every dog has its day in the hunt.',
        'A stray dog does not hear the whisper of a hunter or anyone willing to find it because it is destined to get lost'],
    ),

    ProverbBank(
      images: [
        ImagePath.i1,
        ImagePath.i2,
        ImagePath.i3,
        ImagePath.i4,
      ],
      correctAnswer: 'It is only a child who raises his hinds that will be picked up',
      options: [
        'It is only a child who raises his hinds that will be picked up',
        'A childs laughter is the hearts medicine.',
        'Children are the anchors that hold a mother to life.'],
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
