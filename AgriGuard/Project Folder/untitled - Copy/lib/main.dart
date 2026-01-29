import 'package:flutter/material.dart';
import 'pest_page.dart';
import 'scan_feature.dart';
import 'weather_tab.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'NDVI.dart'; // Make sure this matches your filename/location
import 'profile.dart'; // Import the profile page
import 'forgot_password.dart';
import 'libre_translate_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'providers/translation_provider.dart';
import 'translation_service.dart';  // Contains AppTranslator
import 'screens/crop_planner_screen.dart';
















class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkBg = const Color(0xFF000000);
    final accentColor = const Color(0xFFFFD860);

    return Scaffold(
      backgroundColor: darkBg,
      appBar: AppBar(
        backgroundColor: darkBg,
        title: const Text('Upgrade to Premium',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
        children: [
          // Hero Section
          Column(
            children: [
              const Text(
                "Empower Your Farm",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              Text(
                "Choose the best plan for your harvests. Premium unlocks rapid AI pest diagnosis, unlimited scans, farm management tools, and VIP agri-support.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[300],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
            ],
          ),

          // Pricing Cards
          Row(
            children: [
              // Free Plan
              _PricingCard(
                title: "Basic Farmer",
                description: "Starter access for all small farms",
                price: "\₹0",
                period: "Forever Free",
                accent: false,
                features: [
                  "5 free crop/pest scans per month",
                  "Basic disease information",
                  "Manual farm log entries",
                  "Monthly agri tips newsletter",
                ],
                crosses: [
                  "Unlimited scans & diagnosis",
                  "Farm data analytics",
                  "Exportable treatment history",
                  "Premium 24/7 support",
                  "Priority pest alerts",
                ],
                buttonText: "Current Plan",
                onPressed: () {},
                accentColor: accentColor,
                isCurrent: true,
              ),
              const SizedBox(width:10),
              // Premium Plan
              Expanded(
                child: _PricingCard(
                  title: "Pro Farmer",
                  description:
                  "For agri-leaders optimizing their yields",
                  price: "\₹199",
                  period: "per month",
                  badge: "⭐ MOST POPULAR",
                  accent: true,
                  features: [
                    "Unlimited pest & disease scans",
                    "Detailed crop health analytics",
                    "One-tap export of treatment/farm logs",
                    "Instant pest/disease outbreak SMS alerts",
                    "Premium farm management dashboard",
                    "24/7 dedicated priority support",
                    "Early access to new features"
                  ],
                  buttonText: "Upgrade to Premium",
                  accentColor: accentColor,
                  onPressed: () {
                    // Navigator.pushNamed(context, '/payment');
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Feature Comparison
          const _ComparisonTable(),

          const SizedBox(height: 40),

          // FAQ
          const _FaqSection(),
        ],
      ),
    );
  }
}

// Pricing Card Widget
class _PricingCard extends StatelessWidget {
  final String title, description, price, period, buttonText;
  final bool accent, isCurrent;
  final String? badge;
  final List<String> features;
  final List<String>? crosses;
  final Color accentColor;
  final VoidCallback onPressed;

  const _PricingCard({
    required this.title,
    required this.description,
    required this.price,
    required this.period,
    required this.buttonText,
    required this.accent,
    required this.accentColor,
    required this.onPressed,
    this.features = const [],
    this.crosses,
    this.badge,
    this.isCurrent = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bg = accent
        ? LinearGradient(
      colors: [
        const Color(0xFF181C23),
        const Color(0xFF39332E),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    )
        : LinearGradient(
      colors: [
        const Color(0xFF16171D),
        const Color(0xFF242837),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: bg,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: accent ? accentColor : Colors.grey[400]!,
            width: 2,
          ),
          boxShadow: accent
              ? [
            BoxShadow(
              color: accentColor.withOpacity(0.07),
              blurRadius: 24,
              offset: const Offset(2, 8),
            )
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (badge != null)
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      accentColor,
                      Colors.yellow[100]!,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  badge!,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: accent ? accentColor : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              description,
              style: TextStyle(
                color: accent ? Colors.grey[200] : Colors.grey[400],
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              price,
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w900,
                color: accent ? accentColor : Colors.white,
              ),
            ),
            Text(
              period,
              style: TextStyle(
                color: accent ? Colors.grey[100] : Colors.grey[300],
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 13),
            ...features
                .map((f) => Row(
              children: [
                const Icon(Icons.check_circle,
                    color: Color(0xFF69F0AE), size: 19),
                const SizedBox(width: 8),
                Flexible(
                    child: Text(f,
                        style: TextStyle(color: Colors.white))),
              ],
            ))
                .toList(),
            if (crosses != null)
              ...crosses!
                  .map((x) => Row(
                children: [
                  const Icon(Icons.cancel_outlined,
                      color: Colors.redAccent, size: 19),
                  const SizedBox(width: 8),
                  Flexible(
                      child: Text(x,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough))),
                ],
              ))
                  .toList(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                accent ? accentColor : Colors.transparent,
                foregroundColor:
                accent ? Colors.black : accentColor,
                elevation: accent ? 2 : 0,
                padding:
                const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
                side: BorderSide(
                  color: accentColor,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(buttonText),
            )
          ],
        ),
      ),
    );
  }
}

// Comparison Table Widget
class _ComparisonTable extends StatelessWidget {
  const _ComparisonTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1A1E2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Table(
        border: TableBorder.all(
          color: Colors.white24,
          width: 1,
          borderRadius: BorderRadius.circular(12),
        ),
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
        },
        children: [
          _headerRow(),
          _row('AI Scans / Month', '5', 'Unlimited'),
          _row('Scan Report Detail', 'Basic', 'Advanced with Guidance'),
          _row('Crop/Field Analytics', '❌', '✅'),
          _row('Export Farm Log', '❌', '✅'),
          _row('Outbreak Instant Alerts', '❌', '✅ SMS & Push'),
          _row('Support', 'Community', 'Priority 24/7'),
          _row('Agri Tips Newsletter', 'Monthly', 'Weekly'),
          _row('Ad Experience', 'With ads', 'No ads'),
          _row('New Features', 'Later', 'Early Access'),
        ],
      ),
    );
  }

  TableRow _headerRow() => TableRow(children: [
    _cell('Feature', align: Alignment.centerLeft, bold: true, accent: true),
    _cell('Free', align: Alignment.center, bold: true),
    _cell('Premium', align: Alignment.center, bold: true),
  ]);

  TableRow _row(String feature, String free, String premium) => TableRow(
    children: [
      _cell(feature, align: Alignment.centerLeft),
      _cell(free, align: Alignment.center),
      _cell(premium, align: Alignment.center),
    ],
  );

  Widget _cell(String txt,
      {Alignment align = Alignment.centerLeft,
        bool bold = false,
        bool accent = false}) =>
      Padding(
        padding: const EdgeInsets.all(14),
        child: Align(
          alignment: align,
          child: Text(txt,
              style: TextStyle(
                  color: accent ? Color(0xFFFFD860) : Colors.white,
                  fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
                  fontSize: 16)),
        ),
      );
}

// FAQ Section Widget
class _FaqSection extends StatefulWidget {
  const _FaqSection({super.key});
  @override
  State<_FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<_FaqSection> {
  int open = -1;
  final faqs = [
    {
      'q': "What's included in AgriGuard Premium?",
      'a':
      "You get unlimited crop/pest scans, advanced diagnostic reports, farm analytics, full treatment/export tools, VIP alerts, priority support, and no ads."
    },
    {
      'q': "How fast are premium AI diagnoses?",
      'a':
      "Premium users get rapid scan results—typically under 10 seconds, powered by our top AI model and cloud servers."
    },
    {
      'q': "Can I cancel the subscription anytime?",
      'a':
      "Yes—cancel anytime in one tap from your app settings. Your premium features continue until the end of your paid billing period."
    },
    {
      'q': "What crops do you support?",
      'a':
      "AgriGuard supports all major Indian crops and garden veggies/fruits. We're adding more every month—request inside the app!"
    },
    {
      'q': "Are my farm photos and data safe?",
      'a':
      "Yes—only you own your farm scan data/logs. We never share your images, locations, or diagnoses."
    },
    {
      'q': "How do instant pest alerts work?",
      'a':
      "You receive SMS/push alerts if a new pest outbreak is detected in your district or region (using official agri + AgriGuard AI data)."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Frequently Asked Questions",
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFFFFD860),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        ...List<Widget>.generate(faqs.length, (i) {
          final expanded = open == i;
          return Container(
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              color: const Color(0xFF16171D),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white24, width: 1.4),
            ),
            child: ExpansionTile(
              initiallyExpanded: expanded,
              backgroundColor: Colors.transparent,
              collapsedBackgroundColor: Colors.transparent,
              tilePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              title: Text(faqs[i]['q']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  )),
              trailing: Icon(
                expanded ? Icons.remove_circle : Icons.add_circle,
                color: const Color(0xFFFFD860),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 12, bottom: 13, top: 0),
                  child: Text(faqs[i]['a']!,
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w400,
                          fontSize: 15)),
                ),
              ],
              onExpansionChanged: (exp) {
                setState(() {
                  open = exp ? i : -1;
                });
              },
            ),
          );
        }),
      ],
    );
  }
}



// --- PEST DATA MODEL AND REAL DATA (Unchanged) ---
class Pest {
  final String id;
  final String name;
  final String scientificName;
  final String commonCrop;
  final String analysis;
  final String imagePath;

  Pest({required this.id, required this.name, required this.scientificName, required this.commonCrop, required this.analysis, required this.imagePath,});
}

// NEW: Farmer Model (ONLY NEW ADDITION)
class Farmer {
  final String id;
  final String name;
  final String initials;
  final String phone;
  final String email;
  final double hectares;
  final List<String> crops;
  final bool isActive;

  Farmer({
    required this.id,
    required this.name,
    required this.initials,
    required this.phone,
    required this.email,
    required this.hectares,
    required this.crops,
    this.isActive = true,
  });
}

List<Pest> mockPests = [
  // --- General and Polyphagous Pests (10) ---
  Pest(
    id: 'GP1',
    name: 'Aphids',
    scientificName: 'Aphis gossypii, Aphis craccivora',
    commonCrop: 'Wide variety of crops',
    analysis:
    'These **sap-sucking pests** infest tender parts of a wide range of crops, causing **stunted growth** and transmitting viral diseases. They often cluster on new shoots. ',
    imagePath: 'assets/pests/aphids.jpg',
  ),
  Pest(
    id: 'GP2',
    name: 'Whitefly',
    scientificName: 'Bemisia tabaci',
    commonCrop: 'Wide variety of crops',
    analysis:
    'A major vector for viral diseases, whiteflies cause significant damage by sucking sap and covering leaves with sticky honeydew, which promotes the growth of **sooty mold**. ',
    imagePath: 'assets/pests/Whitefly.jpg',
  ),
  Pest(
    id: 'GP3',
    name: 'Thrips',
    scientificName: 'Scirtothrips dorsalis, Thrips tabaci',
    commonCrop: 'Wide variety of crops',
    analysis:
    'These tiny insects damage leaves and fruits by **scraping tissue and sucking sap**, leading to silvering or bronzing of the foliage and deformation of fruit.',
    imagePath: 'assets/pests/Thrips.jpg',
  ),
  Pest(
    id: 'GP4',
    name: 'Termites',
    scientificName: 'Odontotermes obesus, Microtermes spp.',
    commonCrop: 'Unirrigated areas',
    analysis:
    'Often a serious pest in unirrigated areas, termites attack crops from sowing to maturity by feeding voraciously on **roots and stems**, leading to sudden plant wilt and death. ',
    imagePath: 'assets/pests/Termites.jpg',
  ),
  Pest(
    id: 'GP8',
    name: 'Fall armyworm',
    scientificName: 'Spodoptera frugiperda',
    commonCrop: 'Maize and other cereal crops',
    analysis:
    'A recent invasive pest that has caused serious damage to maize and other cereal crops. **Larvae feed in the whorl of maize** and leave large, ragged holes. ',
    imagePath: 'assets/pests/Fall armyworm.jpg',
  ),
  Pest(
    id: 'GP9',
    name: 'Pod borer',
    scientificName: 'Helicoverpa armigera',
    commonCrop: 'Many crops',
    analysis:
    'A polyphagous pest whose larvae feed on foliage and **bore into the pods and fruit** of many crops, causing direct damage to the harvested product. ',
    imagePath: 'assets/pests/Pod borer.jpg',
  ),

// --- Pests of Cereal Crops (Updated) ---
  Pest(
    id: 'CP1',
    name: 'Yellow stem Borer',
    scientificName: 'Scirpophaga incertulas',
    commonCrop: 'Rice',
    analysis:
    'A serious pest of rice that causes **"dead hearts"** in young plants (the central shoot dies) and **"white ears"** in the reproductive stage (empty grain heads).',
    imagePath: 'assets/pests/Yellow stem Borer.jpg',
  ),
  Pest(
    id: 'CP2',
    name: 'Brown plant Hopper',
    scientificName: 'Nilaparvata lugens',
    commonCrop: 'Rice',
    analysis:
    'A destructive rice pest that causes **"hopper burn,"** leading to the drying of plants in patches, and is a major transmitter of viral diseases. ',
    imagePath: 'assets/pests/Brown plant Hopper.jpg',
  ),
  Pest(
    id: 'CP4',
    name: 'Gall midge',
    scientificName: 'Orseolia oryzae',
    commonCrop: 'Rice',
    analysis:
    'The larvae feed on the growing points of rice, leading to the formation of silvery **"onion shoot" galls** instead of productive tillers. ',
    imagePath: 'assets/pests/Gall midge.jpg',
  ),

// --- Pests of Vegetable Crops (Updated) ---
  Pest(
    id: 'VP1',
    name: 'Fruit borer',
    scientificName: 'Leucinodes orbonalis',
    commonCrop: 'Brinjal',
    analysis:
    'The larvae **bore into brinjal shoots and fruits**, causing wilting of shoots and making the fruits unmarketable due to boreholes and internal damage. ',
    imagePath: 'assets/pests/Fruit borer.jpg',
  ),

  Pest(
    id: 'VP2',
    name: 'Diamondback moth',
    scientificName: 'Plutella xylostella',
    commonCrop: 'Cabbage, Cruciferous vegetables',
    analysis:
    'A major pest of cruciferous vegetables like cabbage, its larvae **skeletonize leaves**, creating "window panes" of transparent tissue. ',
    imagePath: 'assets/pests/Diamondback moth.jpg',
  ),
  Pest(
    id: 'VP8',
    name: 'Leaf miner',
    scientificName: 'Liriomyza spp.',
    commonCrop: 'Many vegetables',
    analysis:
    'Larvae of these flies create characteristic **tunnels or mines in the leaves** of many vegetables, reducing the leaf area available for photosynthesis. ',
    imagePath: 'assets/pests/Leaf miner.jpg',
  ),
  Pest(
    id: 'VP9',
    name: 'Nematodes',
    scientificName: 'Meloidogyne spp.',
    commonCrop: 'Many vegetable crops',
    analysis:
    'Microscopic pests that form **galls on the roots** of many vegetable crops, inhibiting water and nutrient uptake, causing stunted growth and yellowing. ',
    imagePath: 'assets/pests/Nematodes.jpg',
  ),
  Pest(
    id: 'VP10',
    name: 'Tuta absoluta',
    scientificName: 'Tuta absoluta',
    commonCrop: 'Tomato',
    analysis:
    'An invasive pest that severely damages tomato crops by **mining leaves and boring into fruits**. It is highly destructive and difficult to control. ',
    imagePath: 'assets/pests/Tuta absoluta.jpg',
  ),

// --- Pests of Fruit Crops (Updated) ---
  Pest(
    id: 'FP4',
    name: 'Mealybug',
    scientificName: 'Planococcus citri',
    commonCrop: 'Citrus, Cotton, Grape, Sugarcane, Ornamentals',
    analysis:
    'Oval, soft-bodied, cottony insects that **suck plant sap**, causing yellowing, wilting, and distorted growth. They excrete sticky honeydew fostering sooty mold. ',
    imagePath: 'assets/pests/Mealybug.jpg',
  ),

// --- Pests of Cotton and Sugarcane (Updated) ---
  Pest(
    id: 'CSP1',
    name: 'Pink bollworm',
    scientificName: 'Pectinophora gossypiella',
    commonCrop: 'Cotton',
    analysis:
    'Larvae damage cotton by **feeding inside the bolls**, reducing fiber quality and quantity and staining the lint. ',
    imagePath: 'assets/pests/Pink bollworm.jpg',
  ),
  Pest(
    id: 'CSP5',
    name: 'Top shoot Borer',
    scientificName: 'Scirpophaga excerptalis',
    commonCrop: 'Sugarcane',
    analysis:
    'This pest damages the growing point of the sugarcane stalk, resulting in a **dead heart** and a characteristic bunchy top appearance, severely stunting cane growth. ',
    imagePath: 'assets/pests/Top shoot Borer.jpg',
  ),

// --- MISSING PEST ENTRIES ADDED (NP1 to NP11) ---
  Pest(
    id: 'NP1',
    name: 'Red mite',
    scientificName: 'Panonychus ulmi',
    commonCrop: 'Apple, Pear, Plum, Peach, Grapes',
    analysis:
    'These pests cause bronze or reddish discoloration (bronzing) and leaf stippling. Severe infestations lead to premature leaf drop and negatively affect fruit size and bud formation for the next season.',
    imagePath: 'assets/pests/Red mite.jpg',
  ),
  Pest(
    id: 'NP2',
    name: 'Jassids',
    scientificName: 'Amrasca devastans, Empoasca spp.',
    commonCrop: 'Cotton, Potato, Okra, Brinjal, Pulses',
    analysis:
    'These active insects suck sap, causing leaves to curl downwards and yellow, leading to a condition known as "hopper burn" (scorching/browning of leaf edges). They also transmit plant viruses.',
    imagePath: 'assets/pests/Jassids.jpg',
  ),
  Pest(
    id: 'NP3',
    name: 'Cutworm',
    scientificName: 'Agrotis ipsilon, Feltia subterranea',
    commonCrop: 'Corn, Tomato, Tobacco, Cabbage, Beans, young seedlings.',
    analysis:
    'Nocturnal larvae that cut young seedlings at or just above the soil line, leading to the rapid loss of stand, especially in corn and vegetables.',
    imagePath: 'assets/pests/Cutworm.jpg',
  ),
  Pest(
    id: 'NP4',
    name: 'Scale insects',
    scientificName: 'Diaspididae, Coccidae (Varies)',
    commonCrop: 'Citrus, Apple, Ornamentals, Coffee, Tropical fruits.',
    analysis:
    'These immobile pests suck sap, causing yellowing, defoliation, and branch dieback. Soft scales produce large amounts of honeydew and Sooty mold.',
    imagePath: 'assets/pests/Scale insects.jpg',
  ),
  Pest(
    id: 'NP5',
    name: 'Leaf webber',
    scientificName: 'Lepidopteran larvae (Various spp.)',
    commonCrop: 'Coconut, Tea, Castor, Citrus.',
    analysis:
    'Caterpillars spin silk threads to fold or roll leaves together, feeding inside the protected web, skeletonizing the tissue. This reduces photosynthetic capacity.',
    imagePath: 'assets/pests/Leaf webber.jpg',
  ),
  Pest(
    id: 'NP6',
    name: 'Hairy caterpillar',
    scientificName: 'Spilosoma obliqua',
    commonCrop: 'Castor, Jute, Mungbean, Sunflower, Cotton, Pulses.',
    analysis:
    'Caterpillars are densely covered with long hairs. They feed voraciously, often gregariously, stripping entire leaves (defoliation) down to the veins, leading to major yield loss.',
    imagePath: 'assets/pests/Hairy caterpillar.jpg',
  ),
  Pest(
    id: 'NP7',
    name: 'Shoot borer',
    scientificName: 'Chilo infuscatellus',
    commonCrop: 'Sugarcane.',
    analysis:
    'The larva bores into the primary shoot of the host plant, causing the central whorl of leaves to dry up, forming a "dead heart," which encourages unproductive side-tillering.',
    imagePath: 'assets/pests/Shoot borer.jpg',
  ),
  Pest(
    id: 'NP8',
    name: 'Cabbage worm',
    scientificName: 'Pieris rapae',
    commonCrop: 'Cabbage, Broccoli, Cauliflower, Kale.',
    analysis:
    'The velvety green caterpillars chew large, ragged holes in the outer and inner leaves of cabbage and related crops, contaminating the heads with frass and making them unmarketable.',
    imagePath: 'assets/pests/Cabbage worm.jpg',
  ),
  Pest(
    id: 'NP9',
    name: 'Flea beetle',
    scientificName: 'Phyllotreta spp.',
    commonCrop: 'Cabbage, Radish, Potato, Eggplant, Corn.',
    analysis:
    'Small beetles that jump like fleas. Adults chew numerous small, circular holes ("shot-hole" or pitting damage) in leaves, especially on young seedlings, which can severely stunt growth.',
    imagePath: 'assets/pests/Flea beetle.jpg',
  ),
  Pest(
    id: 'NP10',
    name: 'Spider mite',
    scientificName: 'Tetranychus urticae',
    commonCrop: 'Tomato, Cucumber, Beans, Eggplant, Cotton, Fruit trees.',
    analysis:
    'Tiny mites that cause fine yellow or white stippling on leaves. Look for fine, silky webbing. Heavy infestations result in bronze, dry leaves and plant death, especially in hot, dry weather.',
    imagePath: 'assets/pests/Spider mite.jpg',
  ),
  Pest(
    id: 'NP11',
    name: 'Leaf folder',
    scientificName: 'Cnaphalocrocis medinalis',
    commonCrop: 'Rice',
    analysis:
    'Small, greenish-yellow larvae that **fold rice leaves longitudinally** and feed from within, scraping the green tissue (chlorophyll). This reduces photosynthetic capacity.',
    imagePath: 'assets/pests/Leaf folder.jpg',
  ),

// =========================================================================
// --- NEW SECTION: DISEASES ADDED FROM ToFollow_txt2.txt (20 Entries) ---
// =========================================================================

  Pest(
    id: 'D01',
    name: 'Bacterial wilt',
    scientificName: 'Ralstonia solanacearum',
    commonCrop: 'Tomato, Potato, Eggplant, Pepper',
    analysis:
    'A bacterium that blocks the xylem (water-conducting vessels), causing sudden, irreversible **wilting of the entire plant** during the day, even with adequate soil moisture.',
    imagePath: 'assets/pests/Bacterial wilt.jpg',
  ),
  Pest(
    id: 'D02',
    name: 'Black sigatoka',
    scientificName: 'Mycosphaerella fijiensis (Fungus)',
    commonCrop: 'Banana',
    analysis:
    'Causes characteristic dark streaks and spots on banana leaves, leading to large necrotic areas. This drastically reduces the photosynthetic area and results in **premature ripening** and smaller fruit.',
    imagePath: 'assets/pests/Black sigatoka.jpg',
  ),

  Pest(
    id: 'D03',
    name: 'Citrus canker',
    scientificName: 'Xanthomonas axonopodis pv. citri (Bacterium)',
    commonCrop: 'Citrus (Orange, Lemon, Grapefruit)',
    analysis:
    'Highly contagious pest causing **raised, corky lesions or cankers** on leaves, stems, and fruit. While generally not fatal, it reduces fruit marketability and quality.',
    imagePath: 'assets/pests/Citrus canker.jpg',
  ),
  Pest(
    id: 'D04',
    name: 'Damping-off',
    scientificName: 'Pythium and Rhizoctonia spp. (Fungi)',
    commonCrop: 'Seedlings of almost all vegetables and flowers',
    analysis:
    'A fungal pest affecting seedlings. It causes seeds to rot before emergence (**pre-emergence**) or causes the stem to decay near the soil line, leading to the **collapse and death** of emerged seedlings (**post-emergence**).',
    imagePath: 'assets/pests/Damping-off.jpg',
  ),
  Pest(
    id: 'D05',
    name: 'Dieback',
    scientificName: 'Colletotrichum gleosporoides (Fungus)',
    commonCrop: 'Chilli, Citrus, Mango',
    analysis:
    'Characterized by the **progressive death of shoots and branches**, starting from the tip and moving downwards. Often causes fruit rot and is associated with poor tree vigor.',
    imagePath: 'assets/pests/Dieback.jpg',
  ),
  Pest(
    id: 'D06',
    name: 'Downy mildew',
    scientificName: 'Peronospora spp. (Oomycete)',
    commonCrop: 'Grape, Cucumber, Onion, Cabbage',
    analysis:
    'Causes yellow/pale green spots on the upper leaf surface and a characteristic **purplish-grey, downy growth** on the underside of leaves, especially in cool, humid conditions.',
    imagePath: 'assets/pests/Downy mildew.jpg',
  ),
  Pest(
    id: 'D07',
    name: 'Early blight',
    scientificName: 'Alternaria solani (Fungus)',
    commonCrop: 'Tomato, Potato',
    analysis:
    'Causes dark, circular spots on older leaves with **concentric rings** (a "target-like" pattern). It leads to premature defoliation and sunscald on fruits.',
    imagePath: 'assets/pests/Early blight.jpg',
  ),
  Pest(
    id: 'D08',
    name: 'Foot rot',
    scientificName: 'Phytophthora and Fusarium spp. (Fungi)',
    commonCrop: 'Betelvine, Wheat, Ginger, Citrus',
    analysis:
    'A severe pest where the fungus attacks the collar region or base of the stem (the foot), leading to **rotting and girdling of the stem** and eventual plant death.',
    imagePath: 'assets/pests/Foot rot.jpg',
  ),
  Pest(
    id: 'D09',
    name: 'Gummosis',
    scientificName: 'Phytophthora spp. (Fungus)',
    commonCrop: 'Citrus, Stone fruits (Peach, Plum)',
    analysis:
    'Identified by the **oozing of amber or dark brown, gummy sap** from lesions on the trunk or main branches. Severe cases can girdle the trunk and kill the tree.',
    imagePath: 'assets/pests/Gummosis.jpg',
  ),
  Pest(
    id: 'D10',
    name: 'Late blight',
    scientificName: 'Phytophthora infestans (Oomycete)',
    commonCrop: 'Potato, Tomato',
    analysis:
    'Causes dark, water-soaked spots on leaves that turn black. A **white, cottony fungal growth** appears on the leaf underside. It is highly aggressive and can destroy entire crops rapidly.',
    imagePath: 'assets/pests/Late blight.jpg',
  ),
  Pest(
    id: 'D11',
    name: 'Leaf curl Virus',
    scientificName: 'Begomovirus (Virus)',
    commonCrop: 'Chilli, Tomato, Papaya, Tobacco',
    analysis:
    'Transmitted by whiteflies, it causes leaves to become **crinkled, curled, puckered, and severely reduced in size**. Infected plants become stunted and produce little to no fruit.',
    imagePath: 'assets/pests/Leaf curl Virus.jpg',
  ),
  Pest(
    id: 'D12',
    name: 'Leaf rust',
    scientificName: 'Puccinia recondita (Fungus)',
    commonCrop: 'Wheat, Barley, Coffee',
    analysis:
    'Forms small, circular or oval **orange-brown pustules** (containing spores) primarily on the upper surface of leaves. Severe infection reduces photosynthesis and grain filling.',
    imagePath: 'assets/pests/Leaf rust.jpg',
  ),

  Pest(
    id: 'D13',
    name: 'Mosaic virus',
    scientificName: 'Potyvirus, Cucumovirus (Varies)',
    commonCrop: 'Cucumber, Tobacco, Beans, Papaya',
    analysis:
    'Causes a characteristic **mosaic pattern** of light green and dark green areas on the leaves, along with crinkling and distortion. It results in stunted growth and low yields.',
    imagePath: 'assets/pests/Mosaic virus.jpg',
  ),
  Pest(
    id: 'D14',
    name: 'Panama disease',
    scientificName: 'Fusarium oxysporum f. sp. cubense (Fungus)',
    commonCrop: 'Banana',
    analysis:
    'A soil-borne fungus that causes **vascular wilting** (yellowing of older leaves, splitting of pseudostems) in bananas. It is highly persistent and eventually kills the plant.',
    imagePath: 'assets/pests/Panama disease.jpg',
  ),
  Pest(
    id: 'D15',
    name: 'Powdery mildew',
    scientificName: 'Erysiphe and Podosphaera spp. (Fungi)',
    commonCrop: 'Grape, Cucumber, Mango, Peas, Roses',
    analysis:
    'Characterized by a **white to grey powdery growth** appearing on the surface of leaves, stems, and flowers. It is favored by warm, dry days and cool nights, and reduces photosynthesis.',
    imagePath: 'assets/pests/Powdery mildew.jpg',
  ),
  Pest(
    id: 'D16',
    name: 'Rice blast',
    scientificName: 'Magnaporthe oryzae (Fungus)',
    commonCrop: 'Rice',
    analysis:
    'One of the most destructive rice pests, causing **spindle-shaped lesions** on leaves, nodes, and panicles. Neck blast (on the panicle base) is particularly damaging, leading to sterile grains.',
    imagePath: 'assets/pests/Rice blast.jpg',
  ),
  Pest(
    id: 'D17',
    name: 'Rust fungi',
    scientificName: 'Puccinia spp. and Uromyces spp. (Fungi)',
    commonCrop: 'Wheat, Coffee, Beans, Ornamentals',
    analysis:
    'A general term for pests that produce rusty-colored **pustules or lesions** on the leaves and stems. These pustules rupture the plant surface, releasing powdery spores.',
    imagePath: 'assets/pests/Rust fungi.jpg',
  ),
  Pest(
    id: 'D18',
    name: 'Sclerotinia',
    scientificName: 'Sclerotinia sclerotiorum (Fungus)',
    commonCrop: 'Mustard, Sunflower, Beans, Cabbage',
    analysis:
    'Causes **water-soaked lesions** that rapidly develop into soft, watery rot, often with a white, cottony fungal growth. Hard, black resting structures (**sclerotia**) form in the infected tissue.',
    imagePath: 'assets/pests/Sclerotinia.jpg',
  ),
  Pest(
    id: 'D19',
    name: 'Sheath blight',
    scientificName: 'Rhizoctonia solani (Fungus)',
    commonCrop: 'Rice',
    analysis:
    'Forms large, elliptical, green-to-brown spots on the leaf sheath, usually near the water line. Severe infection reduces the number of healthy tillers and affects grain filling.',
    imagePath: 'assets/pests/Sheath blight.jpg',
  ),
  Pest(
    id: 'D20',
    name: 'Smut disease',
    scientificName: 'Ustilago spp. and Tilletia spp. (Fungi)',
    commonCrop: 'Wheat, Maize, Sorghum, Sugarcane',
    analysis:
    'Replaces the healthy kernel or flowering parts with masses of **black, sooty fungal spores** (smut). It directly reduces yield by destroying the grain or inflorescence.',
    imagePath: 'assets/pests/Smut disease.jpg',
  ),


];

// --- CROP DATA MODEL AND REAL DATA (For My Farm Log) ---
class Crop {
  final String name;
  final String soilType;
  final String age;
  final String phase;
  final String pesticideName;
  final String amountGiven;
  final String nextApplicationDate;

  Crop({
    required this.name,
    required this.soilType,
    required this.age,
    required this.phase,
    required this.pesticideName,
    required this.amountGiven,
    required this.nextApplicationDate,
  });
}

List<Crop> mockCurrentCrops = [
  Crop(
    name: 'Maize (Corn)',
    soilType: 'Clay-Loam',
    age: '45 Days',
    phase: 'V6 (Six-Leaf Stage)',
    pesticideName: 'Chlorantraniliprole (Coragen)',
    amountGiven: '150 ml/Acre (First Spray)',
    nextApplicationDate: '2025-11-10 (Before Tasseling)',
  ),
  Crop(
    name: 'Mustard',
    soilType: 'Sandy Loam',
    age: '60 Days',
    phase: 'Flowering Stage',
    pesticideName: 'Acetamiprid (for Aphids)',
    amountGiven: '100 gm/Acre (Second Spray)',
    nextApplicationDate: '2025-10-28 (Post-Flowering)',
  ),
  Crop(
    name: 'Tomato',
    soilType: 'Loamy Soil',
    age: '90 Days',
    phase: 'Fruiting/Harvest',
    pesticideName: 'Spinosad (for Tuta Absoluta)',
    amountGiven: '50 ml/Acre (Last application was 7 days ago)',
    nextApplicationDate: 'Wait for re-infestation (or post-harvest clean-up)',
  ),
  Crop(
    name: 'Brinjal (Eggplant)',
    soilType: 'Silt Loam',
    age: '60 Days',
    phase: 'Early Fruiting',
    pesticideName: 'Lambda-Cyhalothrin 5% EC (for Shoot & Fruit Borer)',
    amountGiven: '500 ml/Hectare (Alternate with Biopesticide)',
    nextApplicationDate: 'Next application in 7 days (alternate treatment)',
  ),
  Crop(
    name: 'Wheat',
    soilType: 'Loamy Soil',
    age: '85 Days',
    phase: 'Grain Filling (Milky Stage)',
    pesticideName: 'Thiamethoxam 25% WG (for Wheat Aphid)',
    amountGiven: '100 gm/Hectare (Foliar Spray targeting earheads)',
    nextApplicationDate: 'No further application needed, crop approaching maturity',
  ),
  Crop(
    name: 'Cotton',
    soilType: 'Black Cotton Soil',
    age: '120 Days',
    phase: 'Boll Formation',
    pesticideName: 'Pyriproxyfen 10% EC (for Pink Bollworm)',
    amountGiven: '1.25 Litres/Hectare (High-Volume Spray)',
    nextApplicationDate: 'Install pheromone traps to check for moth population spike',
  ),
  Crop(
    name: 'Groundnut',
    soilType: 'Red Soil',
    age: '45 Days',
    phase: 'Flowering/Pegging',
    pesticideName: 'Quinalphos 25% EC (for Leaf Miner)',
    amountGiven: '2.0 Litres/Hectare (Foliar Spray)',
    nextApplicationDate: 'Repeat spray in 14 days if fresh leaf damage is visible',
  ),
  Crop(
    name: 'Rice (Paddy)',
    soilType: 'Clay Soil',
    age: '70 Days',
    phase: 'Tillering/Booting',
    pesticideName: 'Cartap Hydrochloride 4G (for Yellow Stem Borer)',
    amountGiven: '25 kg/Hectare (Granular Broadcast)',
    nextApplicationDate: 'Monitor for "White Ears" at the next phase',
  ),
  Crop(
    name: 'Chickpea (Gram)',
    soilType: 'Clay Loam',
    age: '10 Days in Storage',
    phase: 'Storage Infestation',
    pesticideName: 'Aluminum Phosphide (Fumigant) (for Pulse Beetle)',
    amountGiven: '1 Tablet/Ton of grain (Sealed)',
    nextApplicationDate: 'Monitor for adult emergence after 3 months',
  ),
  Crop(
    name: 'Sugarcane',
    soilType: 'Heavy Clay Soil',
    age: '180 Days (Mid-Season)',
    phase: 'Mid-Stalk Elongation',
    pesticideName: 'Carbofuran 3G (for Sugarcane Top Borer)',
    amountGiven: '33 kg/Hectare (Applied in whorl)',
    nextApplicationDate: 'Monitor for secondary shoot infestation in 45 days',
  ),
];

// NEW: Mock Farmer Data (ONLY NEW ADDITION)
List<Farmer> mockFarmers = [
  Farmer(
    id: 'F1',
    name: 'Rajesh Kumar',
    initials: 'RK',
    phone: '+91 98765 43210',
    email: 'rajesh@example.com',
    hectares: 8.5,
    crops: ['Wheat', 'Rice'],
    isActive: true,
  ),
  Farmer(
    id: 'F2',
    name: 'Rita Devi',
    initials: 'PS',
    phone: '+91 98765 43211',
    email: 'Not-Available',
    hectares: 6.2,
    crops: ['Cotton', 'Maize'],
    isActive: true,
  ),
  Farmer(
    id: 'F3',
    name: 'Amit Patel',
    initials: 'AP',
    phone: '+91 98765 43212',
    email: 'amit@example.com',
    hectares: 10.0,
    crops: ['Sugarcane', 'Wheat'],
    isActive: true,
  ),
  Farmer(
    id: 'F4',
    name: 'Khemo Devi',
    initials: 'SV',
    phone: '+91 98765 43213',
    email: 'Not-Available',
    hectares: 5.5,
    crops: ['Rice', 'Vegetables'],
    isActive: false,
  ),
];

// --- WIDGETS AND APP STRUCTURE (ORIGINAL - UNCHANGED) ---

/// 1. Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeGreen = Color(0xFF247755);

    return Scaffold(
      backgroundColor: Color(0xFFF9FBF1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo in a soft card shadow
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
              ),
              shadowColor: themeGreen.withOpacity(0.13),
              color: Colors.white.withOpacity(0.97),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Image.asset(
                  'assets/logo.jpg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 36),
            // Premium text styling
            Text(
              'AgriGuide',
              style: TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.bold,
                color: themeGreen,
                letterSpacing: 1.6,
                fontFamily: 'Montserrat',
                shadows: [
                  Shadow(
                    blurRadius: 12,
                    color: Colors.black.withOpacity(0.09),
                    offset: Offset(3, 4),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            // Subheading tagline for extra polish
            Text(
              'Enabling Smart Farming.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 64),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(themeGreen.withOpacity(0.8)),
              backgroundColor: Colors.white54,
              strokeWidth: 5,
            ),
          ],
        ),
      ),
    );
  }
}

/// 2. Login Page
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Login'),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/logo.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),
                Text(
                  'Welcome Back to AgriGuide',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.primary
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email or Username',
                    hintText: 'e.g., farmer@example.com',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username or email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: '••••••••',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 4) {
                      return 'Password must be at least 4 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                _isLoading
                    ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
                  ),
                )
                    : ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, 'forgot_password'),
                      child: Text("Forgot Password?", style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                    ),

                    TextButton(
                      onPressed: () {
                        // Navigate to sign up page
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
/// Create Account Page
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _createAccount() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Account created successfully!'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
        Navigator.of(context).pushReplacementNamed('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(

          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/logo.jpg',
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),

                // Title
                const Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),

                // Subtitle
                const Text(
                  'Join AgriGuard to start protecting your farm',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF718096),
                  ),
                ),
                const SizedBox(height: 40),

                // Full Name Field
                const Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'John Farmer',
                    hintStyle: const TextStyle(color: Color(0xFFA0AEC0)),
                    filled: true,
                    fillColor: const Color(0xFFF7FAFC),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Email Field
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'farmer@example.com',
                    hintStyle: const TextStyle(color: Color(0xFFA0AEC0)),
                    filled: true,
                    fillColor: const Color(0xFFF7FAFC),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Password Field
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    hintStyle: const TextStyle(color: Color(0xFFA0AEC0)),
                    filled: true,
                    fillColor: const Color(0xFFF7FAFC),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // Create Account Button
                _isLoading
                    ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
                    : ElevatedButton(
                  onPressed: _createAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Sign In Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF718096),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// --- REUSABLE WIDGET FOR HOMESCREEN ---
class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String route;

  const FeatureCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0), // Less up-down
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              TranslatableText(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              TranslatableText(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
        );
  }
}

// --- REDESIGNED HOMESCREEN WITH MULTIPLE MENUS ---
// --- REDESIGNED HOMESCREEN WITH DRAWER AND PREMIUM BADGE ---
// --- REDESIGNED HOMESCREEN WITH DRAWER, PREMIUM BADGE, AND PREMIUM BANNER ---
class TranslatableText extends StatelessWidget {
  final String englishText;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;

  const TranslatableText(
      this.englishText, {
        super.key,
        this.style,
        this.textAlign,
        this.maxLines,
      });

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslationProvider>(
      builder: (context, provider, child) {

        if (!provider.isHindi) {
          return Text(
            englishText,
            style: style,
            textAlign: textAlign,
            maxLines: maxLines,
          );
        }

        // FIXED: IgnorePointer allows InkWell taps through FutureBuilder
        return IgnorePointer(
          ignoring: true,
          child: FutureBuilder<String>(
            future: AppTranslator.translateToHindi(englishText),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data!,
                  style: style,
                  textAlign: textAlign,
                  maxLines: maxLines,
                );
              }
              return Text(
                englishText,
                style: style,
                textAlign: textAlign,
                maxLines: maxLines,
              );
            },
          ),
        );
      },
    );
  }
}




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _startScan(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Simulating image capture...'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    if (context.mounted) {
      Navigator.pushNamed(context, '/predict');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

        appBar: AppBar(
          title: TranslatableText('AgriGuard Dashboard'),
          centerTitle: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                iconSize: 24,
                icon: Consumer<TranslationProvider>(  // ← MOVED HERE (icon only)
                  builder: (context, provider, child) {
                    return Icon(
                      provider.isHindi ? Icons.language : Icons.translate,
                      color: Colors.white,
                    );
                  },
                ),
                onPressed: () {
                  print('TRANSLATE BUTTON CLICKED!');  // ← Add this
                  Provider.of<TranslationProvider>(context, listen: false).toggleHindi(context);
                },
                tooltip: 'Toggle Language',
              ),
            ),
          ],
        ),




        body: Container(
          color: const Color(0xFFF5EEDC), // beige background
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(bottom: 24),
              child: Container(

                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.primary.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const TranslatableText(
                      'Quick Diagnosis',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    const TranslatableText(
                      'Snap a photo of the affected leaf to get instant diagnosis and treatment.',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, 'scan');
                      },
                      icon: const Icon(Icons.camera_alt_outlined, size: 28),
                      label: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        child: TranslatableText("START PLANT SCAN", style:

                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 4,
                      ),
                    )

                  ],
                ),
              ),
            ),

            const TranslatableText(
              'Farming Tools',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 16),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 16,
              childAspectRatio: 1.3, // Increase this value to make boxes shorter
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FeatureCard(
                  title: 'NDVI Index',
                  subtitle: 'Satellite monitoring.',
                  icon: Icons.terrain, // Or any relevant icon
                  color: const Color(0xFF1B5E20),
                  route: 'ndvi',
                ),

                FeatureCard(
                  title: 'Outbreak Alert',
                  subtitle: 'Check for pest risk nearby.',
                  icon: Icons.location_on_outlined,
                  color: const Color(0xFFD32F2F),
                  route: '/outbreak',
                ),
                FeatureCard(
                  title: 'My Farm Log',
                  subtitle: 'Review past scans and treatments.',
                  icon: Icons.history_edu_outlined,
                  color: const Color(0xFF0288D1),
                  route: '/my_farm_log',
                ),

                FeatureCard(
                  title: 'Farmer Log',
                  subtitle: 'Manage farmer contacts & data.',
                  icon: Icons.people_outline,
                  color: const Color(0xFF388E3C),
                  route: '/farmer_log',
                ),
                FeatureCard(
                  title: 'New Crop Plan',
                  subtitle: 'Get soil and prevention advice.',
                  icon: Icons.agriculture_outlined,
                  color: const Color(0xFF1B5E20),
                  route: '/crop-planner',
                ),
                FeatureCard(
                  title: 'Knowledge Base',
                  subtitle: 'Learn about common pests.',
                  icon: Icons.menu_book_outlined,
                  color: const Color(0xFFFFB300),
                  route: '/knowledge_base',
                ),



              ],
            ),

            const SizedBox(height: 24),

            // NEW: Premium Banner
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFB300), Color(0xFFFF6F00)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.workspace_premium, color: Colors.white, size: 32),
                      SizedBox(width: 12),
                      TranslatableText(
                        'Go Premium Today!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const TranslatableText(
                    'Unlock unlimited scans and advanced features',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Icon(Icons.camera_alt_outlined, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: TranslatableText(
                          'Unlimited pest & disease scans',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.agriculture_outlined, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: TranslatableText(
                          'Advanced farm management tools',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.notifications_active_outlined, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: TranslatableText(
                          'Priority pest alerts & SMS notifications',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/premium');
                    },
                    icon: const Icon(Icons.workspace_premium),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: TranslatableText(
                        'Start 5-Day Free Trial',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFFFF6F00),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
        )
    );
  }
}


// NEW: App Drawer Widget
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/logo.jpg',
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'AgriGuard',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Text(
                  'Free Account',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.agriculture),
            title: Text('New Crop Plan'),  // ← KEEP SAME
            onTap: () {  // ← CHANGE THIS LINE ONLY
              Navigator.pop(context);
              Navigator.pushNamed(context, '/crop-planner');  // ← NEW ROUTE
            },
          ),


          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Outbreak Alert'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/outbreak');
            },
          ),
          ListTile(
            leading: const Icon(Icons.grass_outlined),
            title: const Text('My Farm Log'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/my_farm_log');
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book_outlined),
            title: const Text('Knowledge Base'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/knowledge_base');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
            ElevatedButton.icon(
              onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/premium');  // Navigate to premium page
            },
            icon: const Icon(Icons.workspace_premium),
            label: const Text('Upgrade to Premium'),
    // Styling ...


    style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }

  void _showPremiumDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: const [
            Icon(Icons.workspace_premium, color: Color(0xFFFF9800)),
            SizedBox(width: 8),
            Text('Go Premium'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Unlock all features:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 12),
            Text('✓ Unlimited pest & disease scans'),
            Text('✓ Advanced farm management tools'),
            Text('✓ Priority pest alerts & SMS notifications'),
            Text('✓ Farmer contact management'),
            SizedBox(height: 16),
            Text(
              'Start your 5-day free trial today!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF4CAF50),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Maybe Later'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Premium feature - Coming soon!'),
                  backgroundColor: Color(0xFF4CAF50),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CAF50),
            ),
            child: const Text('Start Free Trial'),
          ),
        ],
      ),
    );
  }
}


// --- ALL ORIGINAL SCREENS BELOW (UNCHANGED) ---

// MY FARM LOG SCREEN (ORIGINAL - ALL 10 CROPS)
class MyFarmLogScreen extends StatelessWidget {
  const MyFarmLogScreen({super.key});

  Widget _buildDetailRow(IconData icon, String title, String value, {bool isAlert = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: isAlert ? Colors.red : Colors.grey[700]),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              '$title:',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.w600, color: isAlert ? Colors.red : Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Farm Log: Current Crops'),
        backgroundColor: const Color(0xFF0288D1),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Overview of All Current Crops and Treatment Schedule',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: mockCurrentCrops.length,
              itemBuilder: (context, index) {
                final crop = mockCurrentCrops[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Icon(Icons.grass_outlined, size: 30, color: Theme.of(context).colorScheme.primary),
                    title: Text(
                      crop.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text('Phase: ${crop.phase} | Age: ${crop.age}'),
                    children: <Widget>[
                      const Divider(height: 1, indent: 16, endIndent: 16),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '--- Crop Details ---',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54),
                            ),
                            const SizedBox(height: 8),
                            _buildDetailRow(
                                Icons.eco_outlined, 'Soil Type', crop.soilType),
                            _buildDetailRow(
                                Icons.timelapse, 'Age/Time', crop.age),
                            _buildDetailRow(
                                Icons.scatter_plot_outlined, 'Current Phase', crop.phase),

                            const Divider(height: 20),

                            const Text(
                              '--- Pesticide & Next Treatment ---',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54),
                            ),
                            const SizedBox(height: 8),
                            _buildDetailRow(
                                Icons.bug_report_outlined, 'Pesticide Applied', crop.pesticideName),
                            _buildDetailRow(
                                Icons.numbers, 'Amount Given (Till Date)', crop.amountGiven),
                            _buildDetailRow(
                                Icons.next_plan_outlined, 'Next Application', crop.nextApplicationDate, isAlert: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// HISTORY SCREEN (ORIGINAL)
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Farm Log: Scan History'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history_outlined, size: 60, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              'Past diagnoses and treatment records will appear here.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 5),
            Text(
              'For current crop details, use the "My Farm Log" card on the Dashboard.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

// KNOWLEDGE BASE SCREEN (ORIGINAL - ALL 50 PESTS)
class KnowledgeBaseScreen extends StatelessWidget {
  const KnowledgeBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pest & Disease Knowledge Base'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: mockPests.length,
        itemBuilder: (context, index) {
          final pest = mockPests[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Icon(
                  Icons.bug_report_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 30
              ),
              title: Text(
                pest.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                'Affects: ${pest.commonCrop}',
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, 'pestdetail', arguments: pest);
              },
            ),
          );
        },
      ),
    );
  }
}

class PestDetailScreen extends StatelessWidget {
  final Pest pest;

  const PestDetailScreen({required this.pest, super.key});

  @override
  Widget build(BuildContext context) {
    final RegExp imageRegExp = RegExp(r'\<img[^>]*\>');
    final String imageTag = imageRegExp.firstMatch(pest.analysis)?.group(0) ?? '';
    final String cleanAnalysis = pest.analysis.replaceAll(imageRegExp, '').trim();

    return Scaffold(
      appBar: AppBar(
        title: Text(pest.name),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(pest.imagePath,  // Direct path matching your files
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  debugPrint('❌ Image error: ${pest.name}.jpg - $error');
                  return Container(
                    height: 250,
                    color: Colors.red[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 50, color: Colors.red),
                        Text('${pest.name}.jpg missing'),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            Text(
              pest.scientificName,
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.black54),
            ),
            const SizedBox(height: 4),
            Text(
              'Commonly Affects: ${pest.commonCrop}',
              style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
            ),
            const Divider(height: 32),

            const Text(
              'Detailed Analysis & Damage Description:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              cleanAnalysis,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

// NEW CROP PLANNING SCREEN (ORIGINAL - FULLY FUNCTIONAL)
Widget _buildResultText(BuildContext context, String text) {
  final List<String> lines = text.split('\n');
  final List<Widget> widgets = [];

  final bodyStyle = const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87);
  final h3Style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary);
  final h2Style = TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.secondary);

  for (var line in lines) {
    if (line.trim().startsWith('###')) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 8),
        child: Text(
          line.replaceAll('###', '').trim(),
          style: h3Style,
        ),
      ));
    } else if (line.trim().startsWith('##')) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 10),
        child: Text(
          line.replaceAll('##', '').trim(),
          style: h2Style,
        ),
      ));
    }
    else if (line.trim().startsWith('*') || line.trim().startsWith('-')) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 4),
        child: Text(
          line.replaceAll(RegExp(r'^[*\s]+'), '• ').trim(),
          style: bodyStyle,
        ),
      ));
    } else if (line.trim().isNotEmpty) {
      final textContent = line.replaceAll('**', '').trim();
      final span = TextSpan(
        text: textContent,
        style: bodyStyle,
      );
      widgets.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: RichText(text: span),
      ));
    }
  }
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
}

class NewCropScreen extends StatefulWidget {
  const NewCropScreen({super.key});

  @override
  State<NewCropScreen> createState() => _NewCropScreenState();
}

class _NewCropScreenState extends State<NewCropScreen> {
  final TextEditingController _cropController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _planResult = '';
  bool _isLoading = false;

  @override
  void dispose() {
    _cropController.dispose();
    super.dispose();
  }

  Future<void> _generatePlan() async {
    final cropName = _cropController.text.trim();
    if (cropName.isEmpty || !_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _planResult = 'Generating plan for "$cropName"...';
    });

    await Future.delayed(const Duration(seconds: 3));

    const mockResponse = """
### 1. Soil Suitability and Management

**Soil Type: Requires deep, well-drained loamy to clay-loam soils. It tolerates a wide range of soils but performs best in those with good water retention capacity.

**pH Level: Optimal range is typically 6.0 to 7.5. Acidic or highly alkaline soils can reduce nutrient uptake and yield.

**Nutrient Management (N-P-K):
* Nitrogen (N): Essential for vegetative growth. Needs split application, with basal and top dressing during active growth phases.
* **Phosphorus (P): Crucial for root development and flower initiation. Apply the full dose basally at the time of sowing.
* **Potassium (K): Helps in disease resistance and improving grain quality. Apply basally or as a top dressing.

**Water Management: Requires consistent moisture, especially during flowering and grain-filling stages. Avoid waterlogging.

### 2. Key Prevention Measures for Pests and Diseases

**1. Resistant Varieties: Choose high-yielding varieties with known resistance or tolerance to major regional threats like rust or blight.

**2. Seed Treatment (Mandatory): Treat seeds with a systemic fungicide and insecticide before sowing to protect against soil-borne pathogens and early-stage pests (e.g., shoot flies).

**3. Crop Rotation: Practice rotation with non-host crops (like pulses or oilseeds) to break the life cycles of soil-borne diseases and persistent pests.

**4. Field Sanitation: Remove and destroy crop residue (stubble, weeds) after harvest, as these can harbor pests like stem borers and fungal spores.

**5. Monitoring & Timely Spraying: Implement pheromone traps for monitoring insect populations (e.g., Fall Armyworm). Apply specific, low-toxicity biopesticides or chemical sprays only when the pest population crosses the Economic Threshold Level (ETL).

**6. Weed Control: Keep the field weed-free, as weeds often act as alternate hosts for common pests and viral vectors (like aphids and whiteflies).
""";

    setState(() {
      _planResult = mockResponse;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Crop Planning'),
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Soil Suitability & Prevention Guide',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter the crop you plan to grow to get a comprehensive, personalized plan for successful cultivation.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const Divider(height: 30),

            Form(
              key: _formKey,
              child: TextFormField(
                controller: _cropController,
                decoration: InputDecoration(
                  labelText: 'Enter Crop Name (e.g., Maize, Groundnut)',
                  hintText: 'e.g., Wheat',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.grass_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a crop name.';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),

            _isLoading
                ? Center(
              child: Column(
                children: [
                  CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 10),
                  Text(_planResult, style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
                ],
              ),
            )
                : ElevatedButton.icon(
              onPressed: _generatePlan,
              icon: const Icon(Icons.g_mobiledata_outlined, size: 28),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('GENERATE PLAN', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),

            if (_planResult.isNotEmpty && !_isLoading) ...[
              const Divider(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.lightGreen[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
                ),
                child: _buildResultText(context, _planResult),
              ),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// OUTBREAK MONITOR SCREEN (ORIGINAL - FULLY FUNCTIONAL)
class OutbreakMonitorScreen extends StatefulWidget {
  const OutbreakMonitorScreen({super.key});

  @override
  State<OutbreakMonitorScreen> createState() => _OutbreakMonitorScreenState();
}

class _OutbreakMonitorScreenState extends State<OutbreakMonitorScreen> {
  bool _isLoading = false;
  String _location = 'Fetching Location...';
  String _alertMessage = '';
  String _lastUpdated = '';

  @override
  void initState() {
    super.initState();
    _fetchOutbreaks();
  }

  Future<void> _fetchOutbreaks() async {
    setState(() {
      _isLoading = true;
      _location = 'Fetching Location...';
      _alertMessage = '';
    });

    await Future.delayed(const Duration(seconds: 1));
    const simulatedLocation = 'Pune District, Maharashtra, India';

    setState(() {
      _location = 'Current Area: $simulatedLocation';
      _alertMessage = 'Checking for local alerts via Gemini...';
    });

    await Future.delayed(const Duration(seconds: 3));

    final mockOutbreakResult = """
## Confirmed Outbreak: Fall Armyworm (Spodoptera frugiperda)

**Alert Level: HIGH
**Target Crops: Young Maize, Sorghum, and Pearl Millet.

### Official Guidance (Integrated Pest Management - IPM)
* **Monitoring: Farmers must rigorously check the whorls of young plants for 'shot hole' damage or the presence of larval frass (excreta). Early detection is critical.
* **Initial Control: For small-scale farms, apply sand mixed with lime or wood ash directly into the plant whorls where larvae hide.
* **Severe Infestation: If the infestation exceeds 10% of plants, use recommended biological controls (e.g., Bacillus thuringiensis) or contact the agricultural extension for chemical insecticide recommendations (like Emamectin Benzoate 5% SG).
* **Preventive Measure: Pheromone traps should be installed immediately to monitor adult moth activity and limit population increase.
""";

    setState(() {
      _alertMessage = mockOutbreakResult;
      _lastUpdated = 'Last updated: ${DateTime.now().hour}:${DateTime.now().minute}';
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color alertColor = _isLoading ? Colors.grey : Theme.of(context).colorScheme.secondary;
    if (_alertMessage.contains('HIGH')) {
      alertColor = const Color(0xFFC62828);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pest Outbreak Monitor'),
        backgroundColor: alertColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading ? null : _fetchOutbreaks,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 28, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 10),
                        Text(
                          'Pest Alert Monitor',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _location,
                      style: const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _lastUpdated,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            if (_isLoading)
              Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(color: alertColor),
                    const SizedBox(height: 10),
                    Text(_alertMessage, style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
                  ],
                ),
              )
            else
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: alertColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: alertColor, width: 2),
                ),
                child: _buildResultText(context, _alertMessage),
              ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: _isLoading ? null : () {
                Navigator.pushNamed(context, '/knowledge_base', arguments: 'Fall Armyworm');
              },
              icon: const Icon(Icons.search),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('VIEW PEST IN KNOWLEDGE BASE', style: TextStyle(fontSize: 16)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: alertColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PREDICTION SCREEN (ORIGINAL)
class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnosis Result'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Icon(Icons.science_outlined, size: 60, color: Color(0xFF1976D2)),
              const SizedBox(height: 20),
              const Text(
                'Analyzing Image...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 40),
              const LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1976D2)),
                backgroundColor: Color(0xFFBBDEFB),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const DummyResultDialog(),
                  );
                },
                child: const Text('Show Dummy Result'),
              ),
            ],
          ),
        ),

    );
  }
}

class DummyResultDialog extends StatelessWidget {
  const DummyResultDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Prediction: Early Blight'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Severity: High (75% Confidence)'),
            Divider(),
            Text('Action Plan:', style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              leading: Icon(Icons.local_florist_outlined, color: Colors.brown),
              title: Text('Organic Treatment'),
              subtitle: Text('Apply Neem Oil solution weekly.'),
            ),
            ListTile(
              leading: Icon(Icons.science_outlined, color: Colors.red),
              title: Text('Chemical Treatment'),
              subtitle: Text('Use Chlorothalonil fungicide as directed.'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CLOSE'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

// NEW: FARMER LOG SCREEN (ONLY NEW SCREEN ADDED)
class FarmerLogScreen extends StatefulWidget {
  const FarmerLogScreen({super.key});

  @override
  State<FarmerLogScreen> createState() => _FarmerLogScreenState();
}

class _FarmerLogScreenState extends State<FarmerLogScreen> {
  int get activeFarmerCount => mockFarmers.where((f) => f.isActive).length;

  void _showBulkSMSDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Send Bulk Reminders'),
        content: Text('Send SMS to all $activeFarmerCount active farmers?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('✅ SMS sent to $activeFarmerCount farmers'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF388E3C),
            ),
            child: const Text('Send to All'),
          ),
        ],
      ),
    );
  }

  void _addNewFarmer() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add Farmer feature - Coming soon')),
    );
  }

  void _callFarmer(String phone) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Calling $phone...')),
    );
  }

  void _sendSMS(Farmer farmer) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send SMS to ${farmer.name}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.warning, color: Colors.red),
              title: const Text('Pest Alert'),
              subtitle: const Text('Urgent notification about pest outbreak'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('✅ Pest alert sent to ${farmer.name}'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule, color: Colors.blue),
              title: const Text('Treatment Reminder'),
              subtitle: const Text('Pesticide application schedule'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('✅ Reminder sent to ${farmer.name}'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.cloud, color: Colors.orange),
              title: const Text('Weather Update'),
              subtitle: const Text('Forecast and precautions'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('✅ Weather update sent to ${farmer.name}'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Log'),
        backgroundColor: const Color(0xFF388E3C),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF388E3C).withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Send Bulk Reminders',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E20),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$activeFarmerCount active farmers',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _showBulkSMSDialog,
                  icon: const Icon(Icons.message, size: 18),
                  label: const Text('Send to All'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF388E3C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: mockFarmers.length,
              itemBuilder: (context, index) {
                final farmer = mockFarmers[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: const Color(0xFF388E3C),
                              child: Text(
                                farmer.initials,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    farmer.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: farmer.isActive
                                              ? const Color(0xFFE8F5E9)
                                              : Colors.grey[200],
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          farmer.isActive ? 'Active' : 'Inactive',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: farmer.isActive
                                                ? const Color(0xFF388E3C)
                                                : Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${farmer.hectares} hectares',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        Row(
                          children: [
                            const Icon(Icons.phone, size: 18, color: Colors.black54),
                            const SizedBox(width: 8),
                            Text(
                              farmer.phone,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.email, size: 18, color: Colors.black54),
                            const SizedBox(width: 8),
                            Text(
                              farmer.email,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Managed Crops',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: farmer.crops.map((crop) {
                            return Chip(
                              label: Text(crop),
                              backgroundColor: Colors.grey[200],
                              labelStyle: const TextStyle(fontSize: 12),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => _callFarmer(farmer.phone),
                                icon: const Icon(Icons.phone, size: 18),
                                label: const Text('Call'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black87,
                                  side: const BorderSide(color: Colors.black26),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => _sendSMS(farmer),
                                icon: const Icon(Icons.message, size: 18),
                                label: const Text('Send SMS'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF388E3C),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addNewFarmer,
        backgroundColor: const Color(0xFF388E3C),
        icon: const Icon(Icons.add),
        label: const Text('Add Farmer'),
      ),
    );
  }
}

class TranslationProvider extends ChangeNotifier {
  bool _isHindi = false;
  bool get isHindi => _isHindi;

  Future<void> toggleHindi(BuildContext context) async {
    _isHindi = !_isHindi;
    notifyListeners();
  }
}
// --- Main Application Setup ---
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TranslationProvider(),
      child: const PestPredictionApp(),
    ),
  );
}

class PestPredictionApp extends StatelessWidget {
  const PestPredictionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriScan Pro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          primary: const Color(0xFF4CAF50),
          secondary: const Color(0xFFFF9800),
          background: const Color(0xFFF9F9F9),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/': (context) => const MainLayout(),
        '/signup': (context) => const CreateAccountPage(),
        '/predict': (context) => const PredictionScreen(),

        '/outbreak': (context) => const OutbreakMonitorScreen(),
        '/knowledge_base': (context) => const KnowledgeBaseScreen(),
        '/my_farm_log': (context) => const MyFarmLogScreen(),
        '/premium': (context) => const PremiumPage(),
        '/translator': (context) => const LibreTranslateDemoPage(),
        '/crop-planner': (context) => const CropPlannerScreen(),  // ← ADD THIS


        'forgot_password': (context) => const ForgotPasswordPage(),
        'scan': (context) => ScanFeature(),
        'ndvi': (context) => NDVIPage(apiKey: '322f3521217d77dc3dbb04ae02322b12', polygonId: '6922002a6f78d8560884a88d'),
        'weather': (context) => WeatherTab(apiKey: "YOUR_OPENWEATHER_API_KEY", city: "YourCity"),
        '/farmer_log': (context) => const FarmerLogScreen(), // NEW ROUTE (ONLY NEW ADDITION)
      },
      onGenerateRoute: (settings) {
        if (settings.name == 'pestdetail') {
          final pest = settings.arguments as Pest;
          return MaterialPageRoute(
            builder: (context) => PestInfoPage(pestName: pest.name),
          );
        }
        return null;
      },
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

   List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    WeatherTab(apiKey: "bcabde10bc4908e6ce0fa1d2808c6d07", city: "Pune"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Weather',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
