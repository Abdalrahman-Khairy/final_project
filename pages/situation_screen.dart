import 'package:flutter/material.dart';

import 'choice_screen.dart';

class SituationScreen extends StatelessWidget {
  final List<Map<String, String>> situations = [
    {
      "situation": 'Rising Sea Levels\n in Rosetta',
      "question":
          "The seawater is creeping inland, threatening farms and homes. How will you protect the land from flooding?",
      "optionA": "Build a sea wall to protect my farms.",
      "optionB":
          "Invest in restoring coastal wetlands to enhance the environment and protect my assets.",
      "optionC":
          "Fund the relocation of vulnerable communities to create a sustainable business model for the future.",
    },
    {
      "situation": 'Desertification in the Western Delta',
      "question":
          "The fertile land is turning into desert due to rising temperatures. How will you restore the soil?",
      "optionA": "Plant drought-resistant crops to maintain production.",
      "optionB":
          "Implement a drip irrigation system in my fields to conserve water.",
      "optionC":
          "Collaborate with local farmers to introduce crop rotation and cover crops.",
    },
    {
      "situation": 'Water Shortage During Drought Season',
      "question":
          "The Nile’s water levels are low. How will you distribute the limited water supply?",
      "optionA": "Prioritize water for my farming operations.",
      "optionB": "Introduce water rationing for my agricultural business.",
      "optionC":
          "Invest in desalination plants to ensure water supply for my business and the community.",
    },
    {
      "situation": 'Salinization of Farmland',
      "question":
          "Seawater intrusion has made the soil salty and unfit for crops. How will you reclaim the land?",
      "optionA": "Use salt-tolerant crops in my fields to adapt.",
      "optionB": "Flush the soil with fresh water from my reserves.",
      "optionC":
          "Create artificial drainage systems to reclaim the land for future cultivation.",
    },
    {
      "situation": 'Climate-Driven Pest Invasions',
      "question":
          "New pests are destroying crops due to changing weather patterns. How will you defend the crops?",
      "optionA": "Use chemical pesticides to eliminate pests in my crops.",
      "optionB": "Introduce natural predators for pest control in my fields.",
      "optionC":
          "Invest in developing pest-resistant crop varieties for long-term sustainability.",
    },
    {
      "situation": 'Displaced Farmers in Damietta',
      "question":
          "Rising seas and poor harvests have forced farmers off their lands. How will you support them?",
      "optionA": "Set up government-run farms for displaced workers.",
      "optionB":
          "Offer microloans for sustainable farming practices among displaced farmers.",
      "optionC":
          "Partner with NGOs to train farmers in alternative livelihoods.",
    },
    {
      "situation": 'Loss of Biodiversity Along\nthe Nile River',
      "question":
          "Climate change has disrupted ecosystems, threatening wildlife and plant species. How will you protect biodiversity?",
      "optionA": "Establish nature reserves to protect critical habitats.",
      "optionB": "Encourage sustainable farming practices among my peers.",
      "optionC":
          "Reintroduce native species and restore their habitats as part of corporate social responsibility initiatives.",
    },
  ];

  SituationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Situation'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: situations.length,
        itemBuilder: (context, index) {
          return SituationCard(
            situation: situations[index]["situation"].toString(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChoiceScreen(
                    situation: situations[index]['situation'].toString(),
                    question: situations[index]["question"].toString(),
                    optionA: situations[index]["optionA"].toString(),
                    optionB: situations[index]["optionB"].toString(),
                    optionC: situations[index]["optionC"].toString(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SituationCard extends StatelessWidget {
  final String situation;
  final VoidCallback onTap;

  const SituationCard(
      {super.key, required this.situation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            situation,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
