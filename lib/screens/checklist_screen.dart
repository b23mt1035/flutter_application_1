import 'package:flutter/material.dart';
import 'calendar_screen.dart';

class ChecklistScreen extends StatefulWidget {
  final String equipmentCode;
  final String category;

  const ChecklistScreen({super.key, required this.equipmentCode, required this.category});

  @override
  _ChecklistScreenState createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final Map<String, List<String>> checklistItems = {
    '600101': [
      'Check the Smooth operation of the motor without Noise',
      'Check the air filter - for cleanliness',
      'Proper cleaning of Housing',
      'Lubricate all moving parts with lubricant',
      'Check for any loose connection or overheated cable',
      'check all nut bolts condition /tightness',
      'check motor belts & its tension',
      'Feel/check the Air output, its coolness, Odour, cleanliness. (carry over of dust etc..)',
      'Air line - check joints and leakages.'
    ],
    '600102': [
      'Check the Smooth operation of the motor without Noise',
      'Check the air filter - for cleanliness',
      'Proper cleaning of Housing',
      'Lubricate all moving parts with lubricant',
      'Check for any loose connection or overheated cable',
      'check all nut bolts condition /tightness',
      'check motor belts & its tension',
      'Feel/check the Air output, its coolness, Odour, cleanliness. (carry over of dust etc..)',
      'Air line - check joints and leakages.'
    ],
    '600201': [
      'Check the operation of the Fans without Noise (smoothly)',
      'Check the power cord and plug top for any damage',
      'Check the Body Frames for any Damage or Rust',
      'Check the Fixtures on which the Machine is Hanging for tightness'
    ],
    '600202': [
      'Check the operation of the Fans without Noise (smoothly)',
      'Check the power cord and plug top for any damage',
      'Check the Body Frames for any Damage or Rust',
      'Check the Fixtures on which the Machine is Hanging for tightness'
    ],
    '600203': [
      'Check the operation of the Fans without Noise (smoothly)',
      'Check the power cord and plug top for any damage',
      'Check the Body Frames for any Damage or Rust',
      'Check the Fixtures on which the Machine is Hanging for tightness'
    ],
    '600301': [
      'Check Smooth Functioning of the equipment without noise',
      'Check the Welding as per the Voltage adjustment',
      'Check the Electrical Cable and Power cord for any damages.',
      'Check for any power & earthing (ground) leakage'
    ],
    '600302': [
      'Check Smooth Functioning of the equipment without noise',
      'Check the Welding as per the Voltage adjustment',
      'Check the Electrical Cable and Power cord for any damages.',
      'Check for any power & earthing (ground) leakage'
    ],
    '600401': [
      'Water availability in overhead tanks',
      'Pressure of steam in the boiler',
      'Steam temperature in boiler',
      'Water consumption in boiler',
      'Gauge glass valve, mogri valve, air valve, stop valve',
      'Safety valve, field check valve, field pump valve',
      'Field pump no. 1 & 2',
      'Pressure of switch',
      'Mobri switch',
      'Panel',
      'Temperature meter',
      'I.D Fan, F.D Fan, R.A.V',
      'Blow down valve',
      'Pressure gauge valve'
    ],
    '600402': [
      'Use good quality of Salt (Preferably IS 797 Grade)',
      'Check Water PH of Tank and Softener',
      'Check Water Hardness of Tank and Softener',
      'Check Water Flow through softener',
      'Check Electrical Connections of all Machine and Panel',
      'Check Water Pressure Gauge',
      'Cleaning of Dust Collector',
      'Check the cleaning of Chimney',
      'Check Steam Valve and Water Valve',
      'Check the Carbon Smoke in Chimney',
      'Cleaning of Water Tank',
      'Check for any leakage in Pipeline',
      'Cleaning of W.P.H.',
      'Boiler Cleaning'
    ],
    '600501': [
      'check Cleanliness of the machine before running - tava and other surface',
      'Check for no abnormal sound',
      'After Firing see burner\'s performance & Flame should be blue',
      'Put oil and greasing at all necessary points / area',
      'Check the plastic sheet wrapped around the cutter',
      'Clean the machine thoroughly by opening side doors / various panels, if required',
      'Check all motor belts and chain - tension',
      'Check all nut-bolts conditions / tightness',
      'Check the rollers for free movements',
      'Tighten the dry floor Conveyor',
      'Check gas burner and clean the nozzle hole with stove pin, if required',
      'Check all electrical connections',
      'Gas line - check connections and leakage',
      'Check all gear box - oiling, greasing',
      'Check the lubrication system whether oil is reaching in all the bearing'
    ],
    '600502': [
      'check Cleanliness of the machine before running - tava and other surface',
      'Check for no abnormal sound',
      'After Firing see burner\'s performance & Flame should be blue',
      'Put oil and greasing at all necessary points / area',
      'Check the plastic sheet wrapped around the cutter',
      'Clean the machine thoroughly by opening side doors / various panels, if required',
      'Check all motor belts and chain - tension',
      'Check all nut-bolts conditions / tightness',
      'Check the rollers for free movements',
      'Tighten the dry floor Conveyor',
      'Check。至于 gas burner and clean the nozzle hole with stove pin, if required',
      'Check all electrical connections',
      'Gas line - check connections and leakage',
      'Check all gear box - oiling, greasing',
      'Check the lubrication system whether oil is reaching in all the bearing'
    ],
    '600601': [
      'Check the compressor working condition',
      'Check for no ice formation inside cold room',
      'Check the light and fan working condition',
      'Check the working condition of emergency buzzer',
      'Check water and gas leakage in the refrigeration unit',
      'Check the door closing alignment without any leakages',
      'Check for any electrical loose connections',
      'Check the main MCB working condition',
    ],
    '600602': [
      'Check the compressor working condition',
      'Check for no ice formation inside cold room',
      'Check the light and fan working condition',
      'Check the working condition of emergency buzzer',
      'Check water and gas leakage in the refrigeration unit',
      'Check the door closing alignment without any leakages',
      'Check for any electrical loose connections',
      'Check the main MCB working condition',
    ],
    '600701': [
      'Check overhaul body for any welded cracks',
      'Check fasteners tightness at the flange',
      'Check chute door channel for any damage or crack',
      'Check the chute top door hinges for any damages and proper closing',
      'Check for any leakages near ceiling and flange',
    ],
    '600702': [
      'Check overhaul body for any welded cracks',
      'Check fasteners tightness at the flange',
      'Check chute door channel for any damage or crack',
      'Check the chute top door hinges for any damages and proper closing',
      'Check for any leakages near ceiling and flange',
    ],
    '600801': [
      'Check the cooker for proper locking system',
      'Fasteners tightness to be checked',
      'Check for any leakages of water and steam',
      'Remove the perforated sheet and clean with jet washing machine',
      'Check the cooker lids for any bend and crack',
      'In SS steam perforated plates, boiler body, and ball valve welded area check for welding crack damage',
    ],
    '600802': [
      'Check the cooker for proper locking system',
      'Fasteners tightness to be checked',
      'Check for any leakages of water and steam',
      'Remove the perforated sheet and clean with jet washing machine',
      'Check the cooker lids for any bend and crack',
      'In SS steam perforated plates, boiler body, and ball valve welded area check for welding crack damage',
    ],
    '600901': [
      'Check the Smooth operation of the Generator without Noise',
      'Check the oil for dirty, if dirty than replace the oil',
      'Check the Terminal Box for any loose connections',
      'Check the oil and diesel filters for working condition',
      'Check the Level of the Distilled water, if less quantity than refill',
      'Check the Rust Formation on DG body, if their than paint',
      'Check the Diesel Level for 75%, if not their than fill the Diesel',
      'Check the Earthing rod is functioning',
    ],
    '600902': [
      'Check the Smooth operation of the Generator without Noise',
      'Check the oil for dirty, if dirty than replace the oil',
      'Check the Terminal Box for any loose connections',
      'Check the oil and diesel filters for working condition',
      'Check the Level of the Distilled water, if less quantity than refill',
      'Check the Rust Formation on DG body, if their than paint',
      'Check the Diesel Level for 75%, if not their than fill the Diesel',
      'Check the Earthing rod is functioning',
    ],
    '601001': [
      'Check the Smooth functioning of the Fan',
      'Check the tightness of the base bolts and rubber damper bolts for tighteness',
      'Check the Electrical cables for any damage',
      'Check the terminals for any loose connections',
    ],
    '601002': [
      'Check the Smooth functioning of the Fan',
      'Check the tightness of the base bolts and rubber damper bolts for tighteness',
      'Check the Electrical cables for any damage',
      'Check the terminals for any loose connections',
    ],
    '601003': [
      'Check the Smooth functioning of the Fan',
      'Check the tightness of the base bolts and rubber damper bolts for tighteness',
      'Check the Electrical cables for any damage',
      'Check the terminals for any loose connections',
    ],
    '601101': [
      'Cleaning of all necessary areas',
      'All unused cylinders are sealed',
      'Check any leakage',
      'Check all regulators for proper functioning',
      'Check for any rusting/damages in gas line',
      'Emergency doors are easily openable',
      'Required pressure is available at end points',
      'Other - 1',
      'Other - 2',
      'Other - 3',
    ],
    '601201': [
      'Check the operation of the Fans without Noise (smoothly)',
      'Check the power cord and plug top for any damage',
      'Check the Bolts on which the Machine is Hanging for tightness',
      'Check the sensor is working properly or not',
    ],
    '601202': [
      'Check the operation of the Fans without Noise (smoothly)',
      'Check the power cord and plug top for any damage',
      'Check the Bolts on which the Machine is Hanging for tightness',
      'Check the sensor is working properly or not',
    ],
    '601301': [
      'Check for proper working condition of the sensor',
      'Check for proper locking of the dispenser top cover',
      'Check for any chemical leakage from dispenser',
      'Check the battery condition, if weak then replace',
      'Check the chemical level, if low level then refill',
    ],
    '601401': [
      'Check for the Proper Working Condition of the Hydraulic Mechanism',
      'Check for the Bearings and Wheels working condition',
      'Oil & grease Applying To The Bearings And Other Moving Parts',
      'Check the Bearing and Developer pins for any damage, if there then replace',
      'Check the oil in the oil tank, if dirty replace oil',
      'Check for the BaseWheels for proper rotation',
    ],
    '601402': [
      'Check for the Proper Working Condition of the Hydraulic Mechanism',
      'Check for the Bearings and Wheels working condition',
      'Oil & grease Applying To The Bearings And Other Moving Parts',
      'Check the Bearing and Developer pins for any damage, if there then replace',
      'Check the oil in the oil tank, if dirty replace oil',
      'Check for the BaseWheels for proper rotation',
    ],
    '601501': [
      'Check the smooth functioning of the equipment',
      'Check the oil level in the Machine, if less then refill',
      'Check for any damage in electrical cable and power plugs',
      'Check for any leakages in hose pipes input / output',
      'Check the working condition of the pressure switch of machine',
      'Check for any damages of the Base wheels',
    ],
    '601601': [
      'Check the Smooth functioning of the equipment',
      'Check the teeth',
      'Check the tightness of the nut & bolts',
      'Check the electrical cable terminal and Plugs for any damages and power leaks',
      'Remove the side cover and check the motor bearings & shaft pinion for proper lubrication, if not there then lubricate it',
      'Remove the side cover and locks, if loose then replace it',
      'Check the whole body for any welding crack, if there then close it',
    ],
    '601602': [
      'Check the Smooth functioning of the equipment',
      'Check the teeth',
      'Check the tightness of the nut & bolts',
      'Check the electrical cable terminal and Plugs for any damages and power leaks',
      'Remove the side cover and check the motor bearings & shaft pinion for proper lubrication, if not there then lubricate it',
      'Remove the side cover and locks, if loose then replace it',
      'Check the whole body for any welding crack, if there then close it',
    ],
    '601701': [
      'Check the Cables for loose connections to avoid short circuit',
      'Check the Panel Board sides for dust formation, if there then remove it',
      'Check the Power for any leakage with tester, if there then rectify it',
      'Check the proper closing of the panel board door',
      'Check for any abnormal sound in the Panel board',
      'Check the Proper functioning of the Keb -DG Changover switch',
      'Check the Earth pits for proper working',
    ],
    '601702': [
      'Check the Cables for loose connections to avoid short circuit',
      'Check the Panel Board sides for dust formation, if there then remove it',
      'Check the Power for any leakage with tester, if there then rectify it',
      'Check the proper closing of the panel board door',
      'Check for any abnormal sound in the Panel board',
      'Check the Proper functioning of the Keb -DG Changover switch',
      'Check the Earth pits for proper working',
    ],
    '601801': [
      'Check the smooth functioning of the Equipment',
      'Check the electrical cable, terminal and plug for any damage',
      'Check SS drum and abrasive coating for any damage',
      'Check motor for bearing noise and smooth operation',
      'Check the tightness of the side cover screws',
      'Check for any power leak with tester, if there then rectify',
      'Remove side covers and check belt pulley alignment',
      'Check and adjust belt tension',
      'Check for any rust formation on body, if there then remove or paint it',
    ],
    '601901': [
      'Check overhaul body for any welded cracks',
      'Fasteners tightness to be checked at the flange',
      'Check for chute door channel for any damage or crack',
      'Check the Chute top door hinges for any damages and proper closing',
      'Check for any leakages near ceiling and flange',
    ],
    '602001': [
      'Clean the machine thoroughly',
      'Any Loose contacts and conveyors',
      'Check for any unusual sound',
      'Easy Movement of control plate',
      'Adjust and clean the air control valve',
      'Proper adjustment of the buffer',
      'Proper adjustment of post elevation & pitch',
      'Lubricates all moving parts wit lubricate',
      'Any loose connection or overheated cables',
      'Proper cleaning of dust collector',
    ],
    '602101': [
      'Lubrication of the bearings by removing the bearing collars.',
      'Check the oil level in the gearbox by unscrewing the square head plug, also check the oil viscosity if the oil is high viscous change the oil.',
      'Cookers side Fasteners tightness to be checked',
      'Gear box protection SS covers to be removed for pressure washing.',
      'Water leakage and steam leakage to be checked, if their than arrest it',
      'Check the cooker lids for any bend and welding crack.',
      'In SS steam perforated plates, boiler body, and ball valve welded area, check for welding crack and damage.',
    ],
    '602102': [
      'Lubrication of the bearings by removing the bearing collars.',
      'Check the oil level in the gearbox by unscrewing the square head plug, also check the oil viscosity if the oil is high viscous change the oil.',
      'Cookers side Fasteners tightness to be checked',
      'Gear box protection SS covers to be removed for pressure washing.',
      'Water leakage and steam leakage to be checked, if their than arrest it',
      'Check the cooker lids for any bend and welding crack.',
      'In SS steam perforated plates, boiler body, and ball valve welded area, check for welding crack and damage.',
    ],
    '602201': [
      'Cleaning of all necessary areas',
      'All unused cylinders are sealed.',
      'Check any leakage',
      'Check all regulators for proper functioning.',
      'Check for any rusting/damages in gas line',
      'Emergency doors are easily openable.',
      'Required pressure is available at end points.',
      'Check the burner condition and clean the pores',
      'Clean the base plate of bhatti',
      'Remove the burning marks',
    ],
    '602301': [
      'Check the smooth functioning of the equipment.',
      'Check the Belt tension of the motor, if loose than replace.',
      'Check the gear box oil level and oil viscosity, if oil dirty than replace the oil.',
      'Check the tightness of the Fasteners by removing the side SS sheet.',
      'Check the white fiber plate fasteners tightness.',
      'Check the lubrication of the bearings, if not there than lubricate it',
      'Check the Rust formation on the Machine stand, if there than paint or remove it.',
      'Check the roughness of the top stone and base stone.',
    ],
    '602401': [
      'Check the Power cable and power cord for any damages',
      'Check the working of the Main MCB and Area wise MCB\'s',
      'Check for any power Leak on UPS system body and from battery stand',
      'Check the UPS power Backup is in good condition',
      'Check for any dust formation on system body and on batteries, if there than clean it.',
      'Check that UPS warning alarm is working or not when storage power is reducing',
    ],
    '602402': [
      'Check the Power cable and power cord for any damages',
      'Check the working of the Main MCB and Area wise MCB\'s',
      'Check for any power Leak on UPS system body and from battery stand',
      'Check the UPS power Backup is in good condition',
      'Check for any dust formation on system body and on batteries, if there than clean it.',
      'Check that UPS warning alarm is working or not when storage power is reducing',
    ],
    '602501': [
      'Check the Smooth functioning of the equipment.',
      'Check the cutting blades for sharpness',
      'Check the tightness of the fasteners.',
      'Check the electrical cable terminal and Plugs for any damages and power leaks.',
      'Remove the side cover and check the motor bearings for proper lubrication, if not there then lubricate it.',
      'Remove the side cover and check the belt tension, if loose then replace it.',
      'Check the whole body for any welding crack, if there then close it.',
    ],
    '602502': [
      'Check the Smooth functioning of the equipment.',
      'Check the cutting blades for sharpness',
      'Check the tightness of the fasteners.',
      'Check the electrical cable terminal and Plugs for any damages and power leaks.',
      'Remove the side cover and check the motor bearings for proper lubrication, if not there then lubricate it.',
      'Remove the side cover and check the belt tension, if loose then replace it.',
      'Check the whole body for any welding crack, if there then close it.',
    ],
    '602601': [
      'Check the Smooth functioning of the equipment',
      'Check the Pressure gun, Hose pipe & clamping for any leakages',
      'Check the water pressure from gun outlets',
      'Check the water pressure',
      'Check for any oil Leakages, if there then arrest it',
      'Check the Oil level and oil quality, if low level or oil damaged then replace it.',
    ],
    '602602': [
      'Check the Smooth functioning of the equipment',
      'Check the Pressure gun, Hose pipe & clamping for any leakages',
      'Check the water pressure from gun outlets',
      'Check the water pressure',
      'Check for any oil Leakages, if there then arrest it',
      'Check the Oil level and oil quality, if low level or oil damaged then replace it.',
    ],
  };

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final items = checklistItems[widget.equipmentCode] ?? [];
    final filteredItems = items
        .where((item) => item.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Checklist - ${widget.equipmentCode}"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search checklist items...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: filteredItems.isEmpty
                ? const Center(child: Text("No checklist available for this equipment."))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          title: Text(
                            filteredItems[index],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          subtitle: Text(
                            widget.category,
                            style: TextStyle(color: Colors.grey[600], fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CalendarScreen(
                                  equipmentCode: widget.equipmentCode,
                                  checkpoint: filteredItems[index],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}