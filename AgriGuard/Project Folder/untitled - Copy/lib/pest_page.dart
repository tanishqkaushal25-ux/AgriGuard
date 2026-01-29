import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        // Example: Viewing the details for Aphids
        child: PestInfoPage(pestName: 'Aphids'),
      ),
    ),
  ));
}
// ====================================================================
// SECTION 1: MODELS (PestDetails)
// ====================================================================

/// Pest Details Model (Used for the Pest Information Screen)
class PestDetails {
  final String commonName;
  final String scientificName;
  final String type;
  final String identification;
  final String damage;
  final String cropsAffected;
  final String management;
  final String imagePath;

  const PestDetails({
    required this.commonName,
    required this.scientificName,
    required this.type,
    required this.identification,
    required this.damage,
    required this.cropsAffected,
    required this.management,
    required this.imagePath,
  });
}

// ====================================================================
// SECTION 2: PEST DETAIL DATA (2 Completed + Placeholders)
// ====================================================================

/// Map containing all 50 entries. The key must match the pest name
/// used in your diagnosis result (e.g., 'Aphids').
const Map<String, PestDetails> allPestData = {

  'Aphids': PestDetails(
    commonName: 'Aphids, Plant lice, Greenflies',
    scientificName: 'Varies e.g., Aphis gossypii',
    type: 'Sap-sucking insect',
    identification: 'Small 1-3mm, soft-bodied insects, often green, black, or yellow, clustered on the stems, undersides of leaves, and buds. They can be winged or wingless, reproducing rapidly.',
    damage: '1. Direct feeding: Cause leaves to curl, yellow, or distort, and stunt growth. 2. Honeydew & Mold: Excrete sticky honeydew, which leads to black Sooty mold, blocking photosynthesis. 3. Virus transmission: Notorious vectors for numerous plant viruses.',
    cropsAffected: 'Tomato, Potato, Cabbage, Cucumber, Wheat, Maize, Cotton, Citrus.',
    management: 'Cultural: Use strong water jets for small areas, remove weeds, avoid excessive nitrogen. Biological: Introduce ladybird Beetles, Lacewings, or Parasitic wasps. Chemical: Use insecticidal Soaps/Neem oil for mild cases. Use imidacloprid/Thiamethoxam for severe cases, rotating chemical classes.',
    imagePath: 'assets/pests/aphids.jpg',
  ),

  'Tuta absoluta': PestDetails(
    commonName: 'Tomato leaf Miner',
    scientificName: 'Tuta absoluta',
    type: 'Leaf-boring Lepidopteran larva',
    identification: 'Tiny, grey-brown moth. Larvae are greenish-pink, found mining tunnels/galleries in leaves, stems, and boring into tomato fruits.',
    damage: 'Larvae create large, irregular mines in leaves, reducing photosynthetic area and causing premature defoliation. Fruit damage makes crops unmarketable.',
    cropsAffected: 'Tomato, Potato, Eggplant.',
    management: 'Cultural: Crop rotation, removal of infested plants, mass trapping with pheromones. Biological: Predatory insects like Macrolophus pygmaeus. Chemical: Spinosad, Indoxacarb (must be rotated to prevent resistance).',
    imagePath: 'assets/pests/tuta_absoluta.jpg',
  ),

  'Fall armyworm': PestDetails(
    commonName: 'Fall armyworm',
    scientificName: 'Spodoptera frugiperda',
    type: 'Chewing lepidopteran larva',
    identification: 'Caterpillars up to 4cm are dark, with a noticeable inverted light Y shape on the head capsule. They have four large black spots forming a square on the eighth abdominal segment.',
    damage: 'Voracious feeders on leaves and stalks, they drill holes into the whorl/growing point of young maize/corn, often leading to plant death or malformation.',
    cropsAffected: 'Maize/Corn, Sorghum, Rice, Cotton, Pasture grasses.',
    management: 'Cultural: Hand-picking, crushing egg masses. Biological: Bacillus thuringiensis (Bt) applied to the whorl. Chemical: Emamectin benzoate, Chlorantraniliprole (Crucial for control in early stages).',
    imagePath: 'assets/pests/fall_armyworm.jpeg',
  ),

  'Yellow stem Borer': PestDetails(
    commonName: 'Yellow stem Borer',
    scientificName: 'Scirpophaga incertulas',
    type: 'Boring lepidopteran larva',
    identification: 'Moth is yellowish-brown. Larvae are yellow-white, bore into the stem of rice plants, feeding on the inner tissues.',
    damage: 'Causes dead hearts (central shoot withers and dies in vegetative stage) and white heads (panicle remains white and empty in reproductive stage), leading to total yield loss of the affected tillers.',
    cropsAffected: 'Rice/Paddy.',
    management: 'Cultural: Clip seedling tips before transplanting, remove dead hearts, synchronized planting. Biological: Release of parasitic wasps (Trichogramma). Chemical: Fipronil or Cartap hydrochloride granules applied to the field water.',
    imagePath: 'assets/pests/scirpophaga_excerptalis.jpeg',
  ),

  'Pink bollworm': PestDetails(
    commonName: 'Pink bollworm',
    scientificName: 'Pectinophora gossypiella',
    type: 'Boring lepidopteran larva',
    identification: 'Small, grayish-brown moth. Larvae are creamy-white with distinctive pink bands across their bodies, found inside cotton bolls.',
    damage: 'Larvae bore into cotton bolls, feeding on seeds and lint. This results in stained lint, premature boll drop, and reduces the quality and quantity of cotton fiber.',
    cropsAffected: 'Cotton.',
    management: 'Cultural: Use pheromone traps for mass trapping/mating disruption, sanitation (destroying crop residues). Biological: Release trichogramma parasitic wasps. Chemical: Pyrethroids or Thiodicarb, often used at the flowering stage.',
    imagePath: 'assets/pests/pectinophora_gossypiella.jpeg',
  ),

  'Brown plant Hopper': PestDetails(
    commonName: 'Brown plant Hopper (BPH)',
    scientificName: 'Nilaparvata lugens',
    type: 'Sap-sucking insect',
    identification: 'Small 3-5mm, brown-black hoppers, usually wingless (brachypterous) in high-density populations, found clustered at the base of rice tillers.',
    damage: 'Heavy feeding at the plant base causes rapid yellowing, browning, and drying of rice plants, a condition known as hopper burn, leading to massive yield loss. Also transmits Grassy stunt and Ragged stunt viruses.',
    cropsAffected: 'Rice/Paddy.',
    management: 'Cultural: Maintain proper water levels, avoid high nitrogen, use resistant varieties. Biological: Predatory spiders and mirid bugs. Chemical: Buprofezin for nymphs or Dinotefuran (systemic).',
    imagePath: 'assets/pests/brown_plant_hopper.jpeg',
  ),

  'Whitefly': PestDetails(
    commonName: 'Silverleaf whitefly, Sweetpotato whitefly',
    scientificName: 'Bemisia tabaci',
    type: 'Sap-sucking insect',
    identification: 'Tiny, moth-like insects 1.5mm covered in white, waxy powder, found on the undersides of leaves. They rise in a cloud when disturbed.',
    damage: 'Sap feeding causes yellowing, wilting, and reduced yield. Excrete sticky honeydew leading to Sooty mold. Major vectors for devastating plant viruses e.g., Tomato yellow Leaf curl Virus.',
    cropsAffected: 'Tomato, Cotton, Cucumber, Squash, Eggplant, Ornamentals.',
    management: 'Cultural: Yellow sticky traps, reflective mulches. Biological: Introduce encarsia formosa or Lacewings. Chemical: Pyriproxyfen (IGR) or Dinotefuran, focusing on the undersides of leaves.',
    imagePath: 'assets/pests/whitefly.jpg',
  ),

  'Red mite': PestDetails(
    commonName: 'European red Mite',
    scientificName: 'Panonychus ulmi',
    type: 'Sap-sucking Arachnid Mite',
    identification: 'Tiny 0.5mm, reddish, oval-shaped mites, often clustered on leaves. Look for webbing, especially in the growing tips or on the undersides of leaves.',
    damage: 'Causes bronze or reddish discoloration (bronzing) and leaf stippling. Severe infestations lead to premature leaf drop and negatively affect fruit size and bud formation for the next season.',
    cropsAffected: 'Apple, Pear, Plum, Peach, Grapes.',
    management: 'Cultural: Dormant oil application in winter. Biological: Predatory mites (Amblyseius). Chemical: Specific miticides like Abamectin or Spiromesifen, ensuring thorough coverage.',
    imagePath: 'assets/pests/red_mite.jpg',
  ),

  'Thrips': PestDetails(
    commonName: 'Onion thrips, Western flower Thrips',
    scientificName: 'Frankliniella occidentalis, Thrips tabaci',
    type: 'Rasping and sucking insect',
    identification: 'Minute 1-2mm, slender, black or yellowish insects with fringed wings. Damage is a better indicator: look for silvery/brownish streaks on leaves.',
    damage: 'Feeding results in silvery or brownish streaks and blotches on leaves, flowers, and fruit. Transmit tomato Spotted wilt Virus (TSWV) and other viruses.',
    cropsAffected: 'Onion, Garlic, Pepper, Tomato, Beans, Flowers.',
    management: 'Cultural: Water-spraying, blue/yellow sticky traps. Biological: Predatory mites (Amblyseius), Minute pirate Bugs. Chemical: Spinosad or Azadirachtin (Neem oil), rotating with chemical groups like Cyantraniliprole.',
    imagePath: 'assets/pests/thrips.jpg',
  ),

  'Mealybug': PestDetails(
    commonName: 'Mealybug',
    scientificName: 'Planococcus citri, Pseudococcus longispinus',
    type: 'Sap-sucking insect',
    identification: 'Oval, soft-bodied, cottony insects covered in a white, waxy substance, clustered in leaf axils, on stems, or fruit (often resembling cotton fluff).',
    damage: 'Suck plant sap, causing yellowing, wilting, and distorted growth. Excrete honeydew and foster Sooty mold. Severe infestations cause premature leaf and fruit drop.',
    cropsAffected: 'Citrus, Cotton, Grape, Sugarcane, Ornamentals.',
    management: 'Cultural: Strong water jets, alcohol-soaked swab for small areas. Biological: Release the Mealybug destroyer (Cryptolaemus). Chemical: Systemic insecticides (Acetamiprid) or horticultural oil.',
    imagePath: 'assets/pests/planococcus_citri.jpeg',
  ),


  // ENTRY 11: Jassids
  'Jassids': PestDetails(
    commonName: 'Leafhoppers',
    scientificName: 'Amrasca devastans, Empoasca spp.',
    type: 'Sap-sucking insect',
    identification: 'Small 2-4mm, wedge-shaped, active insects that walk sideways and hop/fly when disturbed. Often green or pale yellow, found on the undersides of leaves.',
    damage: 'Suck sap, causing leaves to curl downwards and yellow, leading to a condition known as hopper burn (scorching/browning of leaf edges). Also transmit plant viruses and mycoplasma-like diseases.',
    cropsAffected: 'Cotton, Potato, Okra, Brinjal, Pulses.',
    management: 'Cultural: Yellow sticky traps, reflective mulches. Biological: Ladybird beetles, green lacewings. Chemical: Imidacloprid, Thiamethoxam (Systemic treatment can protect new growth).',
    imagePath: 'assets/pests/amrasca_devastans_empoasca_spp.jpeg',
  ),

  'Pod borer': PestDetails(
    commonName: 'Gram pod Borer, African bollworm',
    scientificName: 'Helicoverpa armigera',
    type: 'Boring lepidopteran larva',
    identification: 'Caterpillars are variable in color (green, brown, or black) with pale lines down the body. They feed by keeping half their body outside the pod/fruit.',
    damage: 'Larvae bore into and feed on seeds inside the pods of leguminous crops, making the pods unusable and leading to direct yield loss.',
    cropsAffected: 'Chickpea, Pigeon pea, Lentil, Tomato, Cotton.',
    management: 'Cultural: Collection and destruction of larvae, T-traps for birds. Biological: Bt, NPV (Nuclear polyhedrosis Virus), Trichogramma parasitic wasps. Chemical: Chlorantraniliprole, Indoxacarb.',
    imagePath: 'assets/pests/pod_borer.jpeg',
  ),

  'Fruit borer': PestDetails(
    commonName: 'Brinjal shoot and Fruit borer',
    scientificName: 'Leucinodes orbonalis',
    type: 'Boring lepidopteran larva',
    identification: 'Small, white larvae that bore into the tender shoots and fruits of the host plant. The entry point is often marked by frass (excrement).',
    damage: 'Infests shoots, causing wilting and drying (dead hearts). Primary damage is boring into fruits, making them unfit for consumption and causing significant market loss.',
    cropsAffected: 'Eggplant/Brinjal, Tomato.',
    management: 'Cultural: Pruning and destroying infested shoots/fruits, use pheromone traps. Biological: Trichogramma parasitic wasps. Chemical: Spinosad, Cypermethrin (Timing treatment to target the moth/egg stage).',
    imagePath: 'assets/pests/leucinodes_orbonalis.jpeg',
  ),

  'Cutworm': PestDetails(
    commonName: 'Black cutworm, Granulate cutworm',
    scientificName: 'Agrotis ipsilon, Feltia subterranea',
    type: 'Chewing lepidopteran larva',
    identification: 'Fleshy, plump, smooth, grayish-black larvae that curl into a C shape when disturbed. They are nocturnal, hiding in the soil during the day.',
    damage: 'Larvae feed at night, cutting young seedlings at or just above the soil line, leading to the rapid loss of stand, especially in corn, vegetables, and tobacco.',
    cropsAffected: 'Corn, Tomato, Tobacco, Cabbage, Beans, young seedlings.',
    management: 'Cultural: Clean cultivation (weed control), deep plowing, bait traps. Chemical: Granular insecticides applied to the soil surface, especially around planting time (Carbaryl baits).',
    imagePath: 'assets/pests/agrotis_ipsilon_feltia_subterranea.jpeg',
  ),

  'Scale insects': PestDetails(
    commonName: 'Armored scale, Soft scale',
    scientificName: 'Diaspididae, Coccidae (Varies)',
    type: 'Sap-sucking insect',
    identification: 'Appear as small, circular or oval, immobile bumps (scales) on stems, branches, and leaves. They are protected by a waxy or armored covering.',
    damage: 'Suck sap, causing yellowing, defoliation, and branch dieback. Soft scales produce large amounts of honeydew and Sooty mold.',
    cropsAffected: 'Citrus, Apple, Ornamentals, Coffee, Tropical fruits.',
    management: 'Cultural: Pruning infested branches. Biological: Ladybird beetles, especially Rodolia cardinalis. Chemical: Horticultural oil (dormant/summer oil) to suffocate them, or systemic insecticides (Dinotefuran).',
    imagePath: 'assets/pests/diaspididae_coccidae_(varies).jpeg',
  ),

  'Termites': PestDetails(
    commonName: 'White ants',
    scientificName: 'Microtermes spp., Odontotermes spp.',
    type: 'Wood/Plant eating insect',
    identification: 'Pale, white, or light-colored insects with soft bodies, distinguished from ants by their broad waist (ants have a constricted waist). They live in large colonies and are usually seen only as workers.',
    damage: 'Attack the roots, stems, and trunk of woody plants and trees, boring into them and hollowing them out, leading to wilting, dieback, and eventual plant death. Often found in dry soil conditions.',
    cropsAffected: 'Sugarcane, Cotton, Wheat, Groundnut, Fruit trees (Citrus, Mango).',
    management: 'Cultural: Good irrigation, remove dead wood/stumps. Chemical: Soil treatment with Chlorpyrifos or Fipronil granules before planting or around tree bases.',
    imagePath: 'assets/pests/termites.webp',
  ),

  'Leaf webber': PestDetails(
    commonName: 'Eriophyid mite',
    scientificName: 'Aceria lycopersici',
    type: 'Webbing lepidopteran larva',
    identification: 'Caterpillars spin silk threads to fold or roll leaves together, feeding inside the protected web. Adults are reddish-brown moths.',
    damage: 'Feeds within the webbed leaves, skeletonizing the tissue. The resulting rolled, dried leaves (web balls) reduce photosynthetic capacity and overall plant vigor.',
    cropsAffected: 'Coconut, Tea, Castor, Citrus.',
    management: 'Cultural: Pruning and burning webbed leaves. Chemical: Quinalphos or Chlorpyrifos targeting the feeding larvae.',
    imagePath: 'assets/pests/leaf_webber.webp',
  ),

  'Hairy caterpillar': PestDetails(
    commonName: 'Bihar hairy Caterpillar',
    scientificName: 'Spilosoma obliqua',
    type: 'Chewing lepidopteran larva',
    identification: 'Caterpillars are reddish-brown to black, densely covered with long, yellowish-brown hairs that often cause skin irritation. They appear in groups, skeletonizing leaves.',
    damage: 'Feeds voraciously, often gregariously, stripping entire leaves (defoliation) down to the veins, leading to major yield loss if not controlled early.',
    cropsAffected: 'Castor, Jute, Mungbean, Sunflower, Cotton, Pulses.',
    management: 'Cultural: Collection and destruction of egg masses and young larvae. Biological: Release trichogramma parasitic wasps. Chemical: Quinalphos or Cypermethrin targeting the gregarious young larvae.',
    imagePath: 'assets/pests/spilosoma_obliqua.jpeg',
  ),

  'Leaf folder': PestDetails(
    commonName: 'Rice leaf Folder',
    scientificName: 'Cnaphalocrocis medinalis',
    type: 'Leaf-folding Lepidopteran larva',
    identification: 'Small, greenish-yellow larvae that fold rice leaves longitudinally and feed from within the protected tube, scraping the green tissue (chlorophyll).',
    damage: 'Reduces the leaf area available for photosynthesis, leading to yellowing of the folded leaves and subsequent reduction in grain filling and yield.',
    cropsAffected: 'Rice/Paddy.',
    management: 'Cultural: Avoid excessive nitrogen fertilizer, draining the field to expose larvae. Biological: Parasitic wasps (Trichogramma). Chemical: Fipronil or Cartap hydrochloride (must penetrate the folded leaves).',
    imagePath: 'assets/pests/cnaphalocrocis_medinalis.jpeg',
  ),

  'Gall midge': PestDetails(
    commonName: 'Rice gall Midge',
    scientificName: 'Orseolia oryzae',
    type: 'Sap-sucking larva (Dipteran)',
    identification: 'The small pink larva feeds inside the developing leaf sheath, causing the growing point to form a hollow, silvery, tube-like structure instead of a leaf or tiller.',
    damage: 'Causes the formation of the distinctive silver shoot or onion shoot, where the central tiller is lost. This results in no panicle or grain from the affected tiller.',
    cropsAffected: 'Rice/Paddy.',
    management: 'Cultural: Use resistant varieties, removal of alternate hosts (weeds). Biological: Predatory spiders and mirid bugs. Chemical: Fipronil or Chlorpyrifos granules applied at early stage of crop.',
    imagePath: 'assets/pests/gall_midge.jpeg',
  ),


  'Leaf miner': PestDetails(
    commonName: 'Serpentine leaf Miner',
    scientificName: 'Liriomyza sativae, L. trifolii',
    type: 'Leaf-boring larva (Dipteran)',
    identification: 'Damage is more visible than the small, black/yellow adult flies. Look for distinct white, winding, serpentine trails (mines) created by larvae tunneling between the leaf surfaces.',
    damage: 'Reduces photosynthetic capacity, makes leaves unsightly, and can lead to premature leaf drop, severely reducing marketable yield in leafy vegetables.',
    cropsAffected: 'Spinach, Lettuce, Tomato, Pepper, Beans, Chrysanthemum.',
    management: 'Cultural: Yellow sticky traps, remove infested leaves. Biological: Parasitic wasps (Diglyphus isaea). Chemical: Systemic insecticides (Cyromazine) are needed to target larvae inside the leaves.',
    imagePath: 'assets/pests/liriomyza_spp.jpeg',
  ),

  'Shoot borer': PestDetails(
    commonName: 'Sugarcane early Shoot borer',
    scientificName: 'Chilo infuscatellus',
    type: 'Boring lepidopteran larva',
    identification: 'Small, brownish-white larva that bores into the primary shoot of the host plant.',
    damage: 'Infests young shoots, causing the central whorl of leaves to dry up, forming a dead heart. This leads to the death of the main shoot and encourages unproductive side-tillering.',
    cropsAffected: 'Sugarcane.',
    management: 'Cultural: Trash mulching prevents moth egg-laying, deep plowing. Biological: Trichogramma parasitic wasps. Chemical: Granular insecticides (Carbofuran) applied in the soil at the base of the shoots.',
    imagePath: 'assets/pests/chilo_infuscatellus.jpeg',
  ),

  'Top shoot Borer': PestDetails(
    commonName: 'Sugarcane top Shoot borer',
    scientificName: 'Scirpophaga excerptalis',
    type: 'Boring lepidopteran larva',
    identification: 'Whitish-yellow larva that bores into the growing top (terminal bud) of the sugarcane stalk.',
    damage: 'Feeds on the growing point, resulting in dead heart (drying of the central shoot) and a characteristic bunchy top appearance, severely stunting the cane growth and reducing juice quality.',
    cropsAffected: 'Sugarcane.',
    management: 'Cultural: Mechanical removal of affected tops. Biological: Trichogramma parasitic wasps. Chemical: Systemic insecticides (Chlorantraniliprole) at early growth stages.',
    imagePath: 'assets/pests/top_shoot_borer.jpg',
  ),

  'Cabbage worm': PestDetails(
    commonName: 'Cabbage white Butterfly, Imported cabbageworm',
    scientificName: 'Pieris rapae',
    type: 'Chewing lepidopteran larva',
    identification: 'Adult is a white butterfly. Larvae are velvety green caterpillars with faint yellow stripes, found feeding on the leaves.',
    damage: 'Chews large, ragged holes in the outer and inner leaves of cabbage, broccoli, and related crops, contaminating the heads with frass and making them unmarketable.',
    cropsAffected: 'Cabbage, Broccoli, Cauliflower, Kale.',
    management: 'Cultural: Row covers, hand-picking. Biological: Bacillus thuringiensis (Bt) spray is highly effective, as are parasitic wasps (Cotesia glomerata). Chemical: Pyrethroids only as last resort.',
    imagePath: 'assets/pests/pieris_rapae.jpeg',
  ),

  'Diamondback moth': PestDetails(
    commonName: 'Diamondback moth (DBM)',
    scientificName: 'Plutella xylostella',
    type: 'Chewing lepidopteran larva',
    identification: 'Small, grayish-brown moth with a distinctive diamond pattern on its back when wings are folded. Larvae are tiny, pale green, and wriggle violently when disturbed, leaving small window-pane-like feeding damage (skeletonization).',
    damage: 'Larvae are highly destructive, skeletonizing leaves and feeding on the heads or flowers of crops, making them the most serious pest of Brassica crops worldwide.',
    cropsAffected: 'Cabbage, Broccoli, Cauliflower, Mustard.',
    management: 'Cultural: Crop rotation, removal of infested plants. Biological: Bacillus thuringiensis (Bt), specific parasitic wasps (Diadegma semiclausum). Chemical: Spinosad, Emamectin benzoate (rotation is critical due to high resistance rates).',
    imagePath: 'assets/pests/plutella_xylostella.jpeg',
  ),

  'Flea beetle': PestDetails(
    commonName: 'Flea beetle',
    scientificName: 'Phyllotreta spp.',
    type: 'Chewing coleopteran insect',
    identification: 'Small 1.5-3mm, oval, dark-colored beetles that have enlarged hind legs, allowing them to jump like fleas when disturbed.',
    damage: 'Adults chew numerous small, circular holes (shot-hole or pitting damage) in leaves, especially on young seedlings, which can severely stunt growth and kill the plants.',
    cropsAffected: 'Cabbage, Radish, Potato, Eggplant, Corn.',
    management: 'Cultural: Floating row covers, trap cropping (mustard). Chemical: Pyrethroids or Neem oil for mild cases. Systemic neonicotinoids for seed treatment in high-risk areas.',
    imagePath: 'assets/pests/phyllotreta_spp.jpeg',
  ),

  'Rice blast': PestDetails(
    commonName: 'Rice blast, Rotten neck',
    scientificName: 'Magnaporthe oryzae (Fungus)',
    type: 'Fungal disease',
    identification: 'Lesions on leaves are characteristic diamond-shaped or spindle-shaped, greyish in the center with dark reddish-brown margins. Neck rot causes the panicle head to break off.',
    damage: 'Reduces the amount of grain and causes empty panicles (white heads). It is one of the most destructive diseases of rice worldwide, especially in humid conditions.',
    cropsAffected: 'Rice/Paddy.',
    management: 'Cultural: Use resistant varieties, avoid excessive nitrogen. Chemical: Systemic fungicides (Tricyclazole, Azoxystrobin) applied preventatively.',
    imagePath: 'assets/pests/rice_blast.jpeg',
  ),

  'Leaf rust': PestDetails(
    commonName: 'Leaf rust, Brown rust',
    scientificName: 'Puccinia recondita (Fungus)',
    type: 'Fungal disease',
    identification: 'Appears as small, reddish-brown, circular to oval pustules (uredinia) on the upper leaf surface, which rupture the epidermis, releasing a dusty mass of spores.',
    damage: 'Reduces photosynthetic area, leading to premature leaf death, decreased plant vigor, and significant reductions in grain yield and quality.',
    cropsAffected: 'Wheat, Barley, Rye (also known as Cereal rust).',
    management: 'Cultural: Use resistant varieties, early planting. Chemical: Foliar fungicides (Triazoles, Strobilurins) applied at the first sign of pustules.',
    imagePath: 'assets/pests/leaf_rust.jpeg',
  ),

  'Sheath blight': PestDetails(
    commonName: 'Rice sheath Blight',
    scientificName: 'Rhizoctonia solani (Fungus)',
    type: 'Fungal disease',
    identification: 'Large, grayish-green, elliptical or irregular lesions on the leaf sheaths near the water line, often with a distinctive purplish-brown border.',
    damage: 'Reduces yield by infecting the leaf sheath and restricting nutrient flow to the panicles, causing poorly filled grains. Favored by high humidity and dense canopies.',
    cropsAffected: 'Rice/Paddy, Corn, Soybean.',
    management: 'Cultural: Avoid excessive nitrogen, wider plant spacing. Chemical: Systemic fungicides (Validamycin, Azoxystrobin) applied to the base of the plant.',
    imagePath: 'assets/pests/sheath_blight.jpeg',
  ),

  'Damping-off': PestDetails(
    commonName: 'Damping-off',
    scientificName: 'Pythium spp., Rhizoctonia solani (Fungi)',
    type: 'Fungal/Oomycete disease',
    identification: 'Causes seeds to rot before germination (pre-emergence) or causes young seedlings to collapse and die right at the soil line (post-emergence). Infected stems are pinched, water-soaked, and soft.',
    damage: 'Leads to a high mortality rate in the seedbed or greenhouse, reducing the total stand and requiring costly replanting. Favored by cool, wet, and poorly drained soils.',
    cropsAffected: 'Almost all vegetable and flower seedlings (Tomato, Cabbage, Pepper).',
    management: 'Cultural: Use sterilized soil, ensure good drainage, avoid overwatering. Chemical: Seed treatment with fungicides (Thiram, Metalaxyl).',
    imagePath: 'assets/pests/damping-off.jpeg',
  ),


  // ENTRY 31: Bacterial wilt
  'Bacterial wilt': PestDetails(
    commonName: 'Bacterial wilt, Southern bacterial Wilt',
    scientificName: 'Ralstonia solanacearum (Bacterium)',
    type: 'Bacterial disease',
    identification: 'Sudden daytime wilting (recovers at night), permanent wilt/death. Bacterial ooze when stem cut in water.',
    damage: 'Blocks xylem → permanent wilting/plant death. Soil persistent.',
    cropsAffected: 'Tomato, Potato, Eggplant, Tobacco, Banana',
    management: 'Cultural: 3-5yr rotation (non-hosts), resistant rootstocks. Chemical: None effective.',
    imagePath: 'assets/pests/bacterial_wilt.jpg',
  ),

  'Early blight': PestDetails(
    commonName: 'Early blight',
    scientificName: 'Alternaria solani (Fungus)',
    type: 'Fungal disease',
    identification: 'Dark brown/black leaf spots with concentric rings (target pattern), starts on lower leaves.',
    damage: 'Leaf spots/defoliation, stem/fruit lesions, sunscald.',
    cropsAffected: 'Tomato, Potato, Eggplant',
    management: 'Cultural: Rotation, spacing, base watering. Chemical: Chlorothalonil, Mancozeb (protective).',
    imagePath: 'assets/pests/early_blight.jpeg',
  ),

  'Late blight': PestDetails(
    commonName: 'Late blight',
    scientificName: 'Phytophthora infestans (Oomycete)',
    type: 'Oomycete/Water mold Disease',
    identification: 'Dark water-soaked leaf/stem lesions → black. White fuzzy mold underside (cool/wet).',
    damage: 'Rapid total plant destruction, tuber/fruit lesions.',
    cropsAffected: 'Potato, Tomato',
    management: 'Cultural: Hilling, disease-free seed. Chemical: Mefenoxam, Propamocarb (preventative).',
    imagePath: 'assets/pests/late_blight.jpeg',
  ),

  'Powdery mildew': PestDetails(
    commonName: 'Powdery mildew',
    scientificName: 'Erysiphe spp., Podosphaera spp. (Fungi)',
    type: 'Fungal disease (Ectoparasite)',
    identification: 'White/grey powdery spots on leaf/stem/fruit upper surfaces (flour dusted).',
    damage: 'Blocks sunlight → yellowing/distortion/leaf drop. High humidity.',
    cropsAffected: 'Grapes, Cucumber, Squash, Roses, Wheat, Ornamentals',
    management: 'Cultural: Air circulation, resistant varieties. Chemical: Sulfur, Myclobutanil, baking soda.',
    imagePath: 'assets/pests/powdery_mildew.jpeg',
  ),

  'Downy mildew': PestDetails(
    commonName: 'Downy mildew',
    scientificName: 'Peronospora spp., Plasmopara viticola (Oomycetes)',
    type: 'Oomycete Water mold Disease',
    identification: 'Angular yellow upper leaf spots, purplish-grey downy growth underside (cool/wet).',
    damage: 'Leaf drop, premature fruit fall, foliage loss.',
    cropsAffected: 'Grapes, Cucumber, Onion, Lettuce, Spinach',
    management: 'Cultural: Air circulation, debris removal. Chemical: Mancozeb, Metalaxyl (preventative).',
    imagePath: 'assets/pests/downy_mildew.jpeg',
  ),

  'Mosaic virus': PestDetails(
    commonName: 'Tobacco mosaic Virus (TMV), Cucumber mosaic Virus (CMV)',
    scientificName: 'Various virus Families',
    type: 'Viral disease',
    identification: 'Mosaic pattern (light/dark green + yellow) on leaves, distortion, stunting.',
    damage: 'Stunting, reduced fruit, misshapen/unmarketable. No cure.',
    cropsAffected: 'Tomato, Tobacco, Cucumber, Pepper, Squash',
    management: 'Cultural: Sanitize tools, remove infected, control vectors (Aphids/Thrips). Chemical: None.',
    imagePath: 'assets/pests/mosaic_virus.jpeg',
  ),

  'Leaf curl Virus': PestDetails(
    commonName: 'Tomato leaf Curl virus (ToLCV), Cotton leaf Curl virus (CLCuV)',
    scientificName: 'Geminivirus group',
    type: 'Viral disease',
    identification: 'Severe leaf curling/crumpling (young leaves), thickened veins underside, stunting.',
    damage: 'Heavy yield loss, small deformed fruit. Whitefly transmitted.',
    cropsAffected: 'Tomato, Cotton, Pepper, Tobacco',
    management: 'Cultural: Resistant varieties, remove infected. Chemical: Dinotefuran (vector control).',
    imagePath: 'assets/pests/leaf_curl_virus.webp',
  ),

  'Black sigatoka': PestDetails(
    commonName: 'Black leaf Streak',
    scientificName: 'Mycosphaerella fijiensis (Fungus)',
    type: 'Fungal disease',
    identification: 'Reddish-brown streaks → large black necrotic spots on young banana leaves.',
    damage: 'Leaf necrosis reduces photosynthesis → small fruit, premature ripening.',
    cropsAffected: 'Banana, Plantain',
    management: 'Cultural: Drainage, defoliation. Chemical: Azoxystrobin (aerial spray).',
    imagePath: 'assets/pests/black_sigatoka.jpeg',
  ),

  'Panama disease': PestDetails(
    commonName: 'Fusarium wilt of Banana',
    scientificName: 'Fusarium oxysporum f. sp. cubense (Fungus)',
    type: 'Fungal disease',
    identification: 'Older leaf yellowing/wilting (skirt effect), vascular red-brown streaking.',
    damage: 'Soil-borne vascular block → irreversible wilt/death.',
    cropsAffected: 'Banana, Plantain',
    management: 'Cultural: Quarantine, resistant varieties. Chemical: None.',
    imagePath: 'assets/pests/panama_disease.jpeg',
  ),

  'Citrus canker': PestDetails(
    commonName: 'Citrus canker',
    scientificName: 'Xanthomonas citri subsp. citri (Bacterium)',
    type: 'Bacterial disease',
    identification: 'Raised corky lesions with yellow halo on leaves/stems/fruit.',
    damage: 'Fruit drop, unmarketable. Wind/rain spread.',
    cropsAffected: 'Citrus (Orange, Grapefruit, Lemon)',
    management: 'Cultural: Windbreaks, pruning. Chemical: Copper bactericides.',
    imagePath: 'assets/pests/citrus_canker.webp',
  ),


  // ENTRY 41: Gummosis
  'Gummosis': PestDetails(
    commonName: 'Citrus gummosis, Foot rot',
    scientificName: 'Phytophthora spp. (Oomycetes)',
    type: 'Oomycete/Fungal disease',
    identification: 'Amber gum oozing from trunk/branch cracks. Dead brown bark underneath.',
    damage: 'Crown/base girdling → wilt/dieback/tree death.',
    cropsAffected: 'Citrus, Apricot, Peach, Cherry',
    management: 'Cultural: Avoid trunk injuries, drainage. Chemical: Phosphite fungicides (injection/drench).',
    imagePath: 'assets/pests/gummosis.jpeg',
  ),

  'Dieback': PestDetails(
    commonName: 'Citrus dieback, Mango dieback',
    scientificName: 'Colletotrichum spp., Pestalotiopsis spp. (Fungi)',
    type: 'Fungal disease/Deficiency syndrome',
    identification: 'Progressive shoot/branch tip death downwards. Zinc/Copper deficiency.',
    damage: 'Reduced flowering/fruit, tree weakening.',
    cropsAffected: 'Citrus, Mango, Guava',
    management: 'Cultural: Prune/burn, nutrition correction. Chemical: Copper oxychloride.',
    imagePath: 'assets/pests/dieback.jpeg',
  ),

  'Wilting disease': PestDetails(
    commonName: 'Fusarium wilt, Verticillium wilt',
    scientificName: 'Fusarium oxysporum, Verticillium dahliae (Fungi)',
    type: 'Vascular fungal Disease',
    identification: 'Lower leaf wilting (one side), brown vascular discoloration.',
    damage: 'Xylem block → irreversible wilt/death. Soil persistent.',
    cropsAffected: 'Tomato, Cotton, Potato, Banana, Ornamentals',
    management: 'Cultural: Resistant varieties, 5-7yr rotation. Chemical: None.',
    imagePath: 'assets/pests/wilting_disease.jpg',
  ),

  'Foot rot': PestDetails(
    commonName: 'Blackleg, Stem rot',
    scientificName: 'Phytophthora spp., Rhizoctonia solani (Fungi/Oomycetes)',
    type: 'Root/Stem disease',
    identification: 'Soft brown/black stem base rot (pinched). Plant collapse.',
    damage: 'Structural base destruction.',
    cropsAffected: 'Pepper, Tomato, Citrus, Cabbage, Ginger',
    management: 'Cultural: Drainage, raised beds. Chemical: Metalaxyl drench.',
    imagePath: 'assets/pests/foot_rot.jpeg',
  ),

  'Rust fungi': PestDetails(
    commonName: 'Rust disease',
    scientificName: 'Puccinia spp., Phakopsora spp. (Fungi)',
    type: 'Fungal disease',
    identification: 'Reddish-brown/orange powdery pustules on leaves/stems (rust powder).',
    damage: 'Premature leaf drop, vigor/yield loss.',
    cropsAffected: 'Coffee, Soybean, Wheat, Beans, Roses',
    management: 'Cultural: Resistant varieties, air circulation. Chemical: Propiconazole.',
    imagePath: 'assets/pests/rust_fungi.jpeg',
  ),

  'Smut disease': PestDetails(
    commonName: 'Loose smut, Covered smut',
    scientificName: 'Ustilago spp., Tilletia spp. (Fungi)',
    type: 'Fungal disease',
    identification: 'Grain heads replaced by black/sooty spore masses.',
    damage: 'No marketable grain from affected heads.',
    cropsAffected: 'Wheat, Barley, Maize, Sorghum',
    management: 'Cultural: Certified seed. Chemical: Triazole seed treatment.',
    imagePath: 'assets/pests/smut_disease.jpeg',
  ),

  'Sclerotinia': PestDetails(
    commonName: 'Sclerotinia stem Rot, White mold',
    scientificName: 'Sclerotinia sclerotiorum (Fungus)',
    type: 'Fungal disease',
    identification: 'Watery stem/leaf/pod rot + white mold. Black sclerotia (mouse droppings).',
    damage: 'Stem girdling → wilt/death.',
    cropsAffected: 'Soybean, Sunflower, Beans, Lettuce',
    management: 'Cultural: Rotation, wide spacing. Chemical: Thiophanate-methyl.',
    imagePath: 'assets/pests/sclerotinia.webp',
  ),

  'Nematodes': PestDetails(
    commonName: 'Root-Knot nematodes, Cyst nematodes',
    scientificName: 'Meloidogyne spp. (Nematode)',
    type: 'Microscopic worm (Ectoparasite/Endoparasite)',
    identification: 'Stunting/yellowing/wilting above, root galls/knots below.',
    damage: 'Root vascular damage → poor uptake, pathogen entry.',
    cropsAffected: 'Tomato, Potato, Cotton, Carrot, Banana (all crops)',
    management: 'Cultural: Marigold rotation, solarization. Chemical: Oxamyl.',
    imagePath: 'assets/pests/nematodes.webp',
  ),

  'Root knot': PestDetails(
    commonName: 'Root-Knot disease',
    scientificName: 'Meloidogyne spp. (Nematode)',
    type: 'Microscopic worm (Endoparasite)',
    identification: 'Root galls/swelling knots from larvae feeding.',
    damage: 'Nutrient deficiency, wilting, stunting (warm sandy soils).',
    cropsAffected: 'Tomato, Potato, Pepper, Cucumber, Beans',
    management: 'Cultural: N-resistant varieties. Chemical: Granular nematicides.',
    imagePath: 'assets/pests/root_knot.jpg',
  ),

  'Spider mite': PestDetails(
    commonName: 'Two-spotted Spider mite',
    scientificName: 'Tetranychus urticae (Arachnid)',
    type: 'Sap-sucking Arachnid Mite',
    identification: 'Tiny (0.5mm) greenish/yellowish with dark spots. Silky webbing, leaf stippling.',
    damage: 'Yellow/white stippling → bronze/dry leaves/plant death (hot/dry).',
    cropsAffected: 'Tomato, Cucumber, Beans, Eggplant, Cotton, Fruit trees',
    management: 'Cultural: Water spray, humidity. Biological: Phytoseiulus mites. Chemical: Abamectin.',
    imagePath: 'assets/pests/tetranychus_urticae.jpeg',
  ),

};

/// Helper function to safely retrieve the data
PestDetails? getPestDetails(String pestName) {
  return allPestData[pestName];
}

// ====================================================================
// SECTION 3: WIDGET (PestDetailScreen)
// ====================================================================

/// The single-page widget to display pest details.
class PestInfoPage extends StatelessWidget {
  final String pestName;

  /// Pass the name of the pest (e.g., 'Aphids') to load its details.
  const PestInfoPage({Key? key, required this.pestName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PestDetails? details = getPestDetails(pestName);

    // Handles the case where the pest name is not found or is a placeholder
    if (details == null || details.scientificName == 'Placeholder') {
      return Scaffold(
        appBar: AppBar(title: Text(pestName)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '⚠️ Data for "$pestName" is currently a placeholder. Please fill in the details in the `allPestData` map to complete the app!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${details.commonName} Details'),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- IMAGE SECTION ---
            Image.asset(
              details.imagePath ?? 'assets/pests/placeholder.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error, size: 80),
            ),


            // --- DETAILS SECTION ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoTable(details),
                  const Divider(height: 30),

                  _buildSectionTitle('🌿 Identification'),
                  _buildSectionContent(details.identification),
                  const SizedBox(height: 15),

                  _buildSectionTitle('⚠️ Damage & Symptoms'),
                  _buildSectionContent(details.damage),
                  const SizedBox(height: 15),

                  _buildSectionTitle('🎯 Key Affected Crops'),
                  _buildSectionContent(details.cropsAffected),
                  const SizedBox(height: 15),

                  _buildSectionTitle('🛡️ Management and Control'),
                  _buildSectionContent(details.management),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET HELPERS (For Table and Text Formatting) ---

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.green.shade800,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(fontSize: 16, height: 1.4),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildInfoTable(PestDetails details) {
    return Table(
      columnWidths: const {
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      children: [
        _buildTableRow('Scientific Name:', details.scientificName),
        _buildTableRow('Pest Type:', details.type),
      ],
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

// ====================================================================
// SECTION 4: DEMO USAGE (You can remove this from your final project)
// ====================================================================
/*
// To test this file independently, you can temporarily add this:
void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        // Example: Viewing the details for Aphids
        child: PestDetailScreen(pestName: 'Aphids'),
      ),
    ),
  ));
}
*/