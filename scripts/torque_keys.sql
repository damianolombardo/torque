USE `hiubwjjf_torque`;
DROP TABLE IF EXISTS `torque_keys`;
CREATE TABLE IF NOT EXISTS `torque_keys` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `type` varchar(255) NOT NULL DEFAULT 'varchar(255)' COMMENT 'Variable Type',
  `units` varchar(255) DEFAULT NULL COMMENT 'Units',
  `populated` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is This Variable Populated?',
  `favorite` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Pre-select this variable for plotting?',
  `min` float DEFAULT NULL COMMENT 'Minimum Value',
  `max` float DEFAULT NULL COMMENT 'Maximum Value',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `torque_keys` (`id`, `description`, `type`, `units`, `populated`, `favorite`, `min`, `max`) VALUES('kff122e', '0-100kph Time', 'float', 's', 1, 0, 0, 16), ('kff1278', '0-100mph Time', 'float', 's', 1, 0, 0, 16), ('kff1006', 'kff1006', 'varchar(255)', NULL, 1, 0, NULL, NULL), ('kff1001', 'kff1001', 'varchar(255)', NULL, 1, 0, NULL, NULL), ('kff124f', '0-200kph Time', 'float', 's', 1, 0, 0, 16), ('kff1277', '0-30mph Time', 'float', 's', 1, 0, 0, 16), ('kff122d', '0-60mph Time', 'float', 's', 1, 0, 0, 16), ('kff122f', '1/4 mile Time', 'float', 's', 1, 0, 0, 30), ('kff1230', '1/8 mile Time', 'float', 's', 1, 0, 0, 16), ('kff1264', '100-0kph Time', 'float', 's', 1, 0, 0, 16), ('kff1280', '100-200kph Time', 'float', 's', 1, 0, 0, 16), ('kff1260', '40-60mph Time', 'float', 's', 1, 0, 0, 16), ('kff1265', '60-0mph Time', 'float', 's', 1, 0, 0, 16), ('kff125e', '60-120mph Time', 'float', 's', 1, 0, 0, 16), ('kff1276', '60-130mph Time', 'float', 's', 1, 0, 0, 16), ('kff125f', '60-80mph Time', 'float', 's', 1, 0, 0, 16), ('kff1261', '80-100mph Time', 'float', 's', 1, 0, 0, 16), ('kff1275', '80-120kph Time', 'float', 's', 1, 0, 0, 16), ('k47', 'Absolute Throttle Position B', 'float', '%', 1, 0, 0, 100), ('kff1223', 'Acceleration Sensor (Total)', 'float', 'g', 1, 0, -1, 1), ('kff1220', 'Acceleration Sensor (X Axis)', 'float', 'g', 1, 0, -1, 1), ('kff1221', 'Acceleration Sensor (Y Axis)', 'float', 'g', 1, 0, -1, 1), ('kff1222', 'Acceleration Sensor (Z Axis)', 'float', 'g', 1, 0, -1, 1), ('k49', 'Accelerator Pedal Position D', 'float', '%', 1, 0, 0, 100), ('k4a', 'Accelerator Pedal Position E', 'float', '%', 1, 0, 0, 100), ('k4b', 'Accelerator Pedal Position F', 'float', '%', 1, 0, 0, 100), ('kff124d', 'Air Fuel Ratio (Commanded)', 'float', NULL, 1, 0, 0, 30), ('kff1249', 'Air Fuel Ratio (Measured)', 'float', NULL, 1, 0, 0, 30), ('k12', 'Air Status', 'float', NULL, 1, 0, NULL, NULL), ('k46', 'Ambient Air Temp', 'float', '&deg;C', 1, 0, -40, 50), ('kff129a', 'Android Device Battery Level', 'float', '%', 1, 0, 0, 100), ('kff1263', 'Average Trip Speed (Whilst Moving Only)', 'float', 'km/h', 1, 0, 0, 16), ('kff1272', 'Average Trip Speed (Whilst Stopped or Moving)', 'float', 'km/h', 1, 0, 0, 16), ('kff1270', 'Barometer (On Android device)', 'float', 'mb', 1, 0, 800, 1100), ('k33', 'Barometric Pressure (From Vehicle)', 'float', 'kPa', 1, 0, 0, 255), ('k3c', 'Catalyst Temperature (Bank 1 Sensor 1)', 'float', '&deg;C', 1, 0, 0, 60), ('k3e', 'Catalyst Temperature (Bank 1 Sensor 2)', 'float', '&deg;C', 1, 0, 0, 60), ('k3d', 'Catalyst Temperature (Bank 2 Sensor 1)', 'float', '&deg;C', 1, 0, 0, 60), ('k3f', 'Catalyst Temperature (Bank 2 Sensor 2)', 'float', '&deg;C', 1, 0, 0, 60), ('kff1258', 'CO2 (Average)', 'float', 'g/km', 1, 0, 0, 120), ('kff1257', 'CO2 (Instantaneous)', 'float', 'g/km', 1, 0, 0, 120), ('k44', 'Commanded Equivalence Ratio (lambda)', 'float', NULL, 1, 0, 0, 2), ('kff126d', 'Cost per mile/km (Instant)', 'float', '$/km', 1, 0, 0, 100), ('kff126e', 'Cost per mile/km (Trip)', 'float', '$/km', 1, 0, 0, 100), ('kff126e', 'Cost per mile/km (Trip)', 'float', '$/km', 1, 0, 0, 100), ('kff126a', 'Distance to empty (Estimated)', 'float', 'km', 1, 0, 0, 100), ('k31', 'Distance Travelled Since Codes Cleared', 'float', 'km', 1, 0, 0, 100), ('k21', 'Distance Travelled With MIL/CEL Lit', 'float', 'km', 1, 0, 0, 100), ('k2c', 'EGR Commanded', 'float', '%', 1, 0, 0, 100), ('k2d', 'EGR Error', 'float', '%', 1, 0, 0, 100), ('k5', 'Engine Coolant Temperature', 'float', '&deg;C', 1, 0, -40, 120), ('kff1273', 'Engine kW (At the Wheels)', 'float', 'kW', 1, 0, 0, 100), ('k4', 'Engine Load', 'float', '%', 1, 0, 0, 100), ('k43', 'Engine Load (Absolute)', 'float', '%', 1, 0, 0, 20000), ('k5c', 'Engine Oil Temperature', 'float', '&deg;C', 1, 0, -40, 60), ('kc', 'Engine RPM', 'float', 'rpm', 1, 0, 0, 10000), ('k52', 'Ethanol Fuel %', 'float', '%', 1, 0, 0, 100), ('k32', 'Evap System Vapor Pressure', 'float', 'Pa', 1, 0, 0, 1000), ('k78', 'Exhaust Gas Temperature Bank 1 Sensor 1', 'float', '&deg;C', 1, 0, 0, 600), ('k79', 'Exhaust Gas Temperature Bank 2 Sensor 1', 'float', '&deg;C', 1, 0, 0, 600), ('kff125c', 'Fuel Cost (Trip)', 'float', '$', 1, 0, 0, 100), ('kff125d', 'Fuel Flow Rate/Hour', 'float', 'l/hr', 1, 0, 0, 100), ('kff125a', 'Fuel Flow Rate/Minute', 'float', 'cc/min', 1, 0, 0, 100), ('k2f', 'Fuel Level (From Engine ECU)', 'float', '%', 1, 0, 0, 100), ('ka', 'Fuel Pressure', 'float', 'kPa', 1, 0, 0, 765), ('k23', 'Fuel Rail Pressure', 'float', 'kPa', 1, 0, 0, 60), ('k22', 'Fuel Rail Pressure (Relative to Manifold Vacuum)', 'float', 'kPa', 1, 0, 0, 60), ('kff126b', 'Fuel Remaining (Calculated From Vehicle Profile)', 'float', '%', 1, 0, 0, 100), ('k3', 'Fuel Status', 'float', NULL, 1, 0, NULL, NULL), ('k7', 'Fuel Trim Bank 1 Long Term', 'float', '%', 1, 0, -25, 25), ('k14', 'Fuel Trim Bank 1 Sensor 1', 'float', '%', 1, 0, -100, 100), ('k15', 'Fuel Trim Bank 1 Sensor 2', 'float', '%', 1, 0, -100, 100), ('k16', 'Fuel Trim Bank 1 Sensor 3', 'float', '%', 1, 0, -100, 100), ('k17', 'Fuel Trim Bank 1 Sensor 4', 'float', '%', 1, 0, -100, 100), ('k6', 'Fuel Trim Bank 1 Short Term', 'float', '%', 1, 0, -25, 25), ('k9', 'Fuel Trim Bank 2 Long Term', 'float', '%', 1, 0, -25, 25), ('k18', 'Fuel Trim Bank 2 Sensor 1', 'float', '%', 1, 0, -100, 100), ('k19', 'Fuel Trim Bank 2 Sensor 2', 'float', '%', 1, 0, -100, 100), ('k1a', 'Fuel Trim Bank 2 Sensor 3', 'float', '%', 1, 0, -100, 100), ('k1b', 'Fuel Trim Bank 2 Sensor 4', 'float', '%', 1, 0, -100, 100), ('k8', 'Fuel Trim Bank 2 Short Term', 'float', '%', 1, 0, -25, 25), ('kff1271', 'Fuel Used (Trip)', 'float', 'l', 1, 0, 0, 100), ('kff1239', 'GPS Accuracy', 'float', 'm', 1, 0, 0, 100), ('kff1010', 'GPS Altitude', 'float', 'm', 1, 0, 0, 100), ('kff123b', 'GPS Bearing', 'float', '&deg;', 1, 0, 0, 360), ('kff1006', 'GPS Latitude', 'double', '&deg;', 1, 0, 0, 100), ('kff123a', 'GPS Satellites', 'float', NULL, 1, 0, 0, 24), ('kff1237', 'GPS vs OBD Speed Difference', 'float', 'km/h', 1, 0, 0, 10), ('kff1226', 'Horsepower (At the Wheels)', 'float', 'hp', 1, 0, 0, 100), ('kf', 'Intake Air Temperature', 'float', '&deg;C', 1, 0, -40, 60), ('kb', 'Intake Manifold Pressure', 'float', 'kPa', 1, 0, 0, 255), ('kff1203', 'Kilometers Per Litre (Instant)', 'float', 'kpl', 1, 0, 0, 100), ('kff5202', 'Kilometers Per Litre (Long Term Average)', 'float', 'kpl', 1, 0, 0, 100), ('kff1207', 'Litres Per 100 Kilometer (Instant)', 'float', 'l/100km', 1, 0, 0, 100), ('kff5203', 'Litres Per 100 Kilometer (Long Term Average)', 'float', 'l/100km', 1, 0, 0, 100), ('k10', 'Mass Air Flow Rate', 'float', 'g/s', 1, 0, 0, 100), ('kff1201', 'Miles Per Gallon (Instant)', 'float', 'mpg', 1, 0, 0, 100), ('kff5201', 'Miles Per Gallon (Long Term Average)', 'float', 'mpg', 1, 0, 0, 100), ('k24', 'O2 Sensor1 Equivalence Ratio', 'float', NULL, 1, 0, 0, 2), ('k34', 'O2 Sensor1 Equivalence Ratio (Alternate)', 'float', NULL, 1, 0, 0, 2), ('kff1240', 'O2 Sensor1 Wide-range Voltage', 'float', 'V', 1, 0, 0, 8), ('k25', 'O2 Sensor2 Equivalence Ratio', 'float', NULL, 1, 0, 0, 2), ('kff1241', 'O2 Sensor2 Wide-range Voltage', 'float', 'V', 1, 0, 0, 8), ('k26', 'O2 Sensor3 Equivalence Ratio', 'float', NULL, 1, 0, 0, 2), ('kff1242', 'O2 Sensor3 Wide-range Voltage', 'float', 'V', 1, 0, 0, 8), ('k27', 'O2 Sensor4 Equivalence Ratio', 'float', NULL, 1, 0, 0, 2), ('kff1243', 'O2 Sensor4 Wide-range Voltage', 'float', 'V', 1, 0, 0, 8), ('k28', 'O2 Sensor5 Equivalence Ratio', 'float', NULL, 1, 0, 0, 2), ('kff1244', 'O2 Sensor5 Wide-range Voltage', 'float', 'V', 1, 0, 0, 8), ('k29', 'O2 Sensor6 Equivalence Ratio', 'float', NULL, 1, 0, 0, 2), ('kff1245', 'O2 Sensor6 Wide-range Voltage', 'float', 'V', 1, 0, 0, 8), ('k2a', 'O2 Sensor7 Equivalence Ratio', 'float', NULL, 1, 0, 0, 2), ('kff1246', 'O2 Sensor7 Wide-range Voltage', 'float', 'V', 1, 0, 0, 8), ('k2b', 'O2 Sensor8 Equivalence Ratio', 'float', NULL, 1, 0, 0, 2), ('kff1247', 'O2 Sensor8 Wide-range Voltage', 'float', 'V', 1, 0, 0, 8), ('kff1214', 'O2 Volts Bank 1 Sensor 1', 'float', 'V', 1, 0, 0, 1), ('kff1215', 'O2 Volts Bank 1 Sensor 2', 'float', 'V', 1, 0, 0, 1), ('kff1216', 'O2 Volts Bank 1 Sensor 3', 'float', 'V', 1, 0, 0, 1), ('kff1217', 'O2 Volts Bank 1 Sensor 4', 'float', 'V', 1, 0, 0, 1), ('kff1218', 'O2 Volts Bank 2 Sensor 1', 'float', 'V', 1, 0, 0, 1), ('kff1219', 'O2 Volts Bank 2 Sensor 2', 'float', 'V', 1, 0, 0, 1), ('kff121a', 'O2 Volts Bank 2 Sensor 3', 'float', 'V', 1, 0, 0, 1), ('kff121b', 'O2 Volts Bank 2 Sensor 4', 'float', 'V', 1, 0, 0, 1), ('kff1296', 'Percentage of City Driving', 'float', '%', 1, 0, 0, 100), ('kff1297', 'Percentage of Highway Driving', 'float', '%', 1, 0, 0, 100), ('kff1298', 'Percentage of Idle Driving', 'float', '%', 1, 0, 0, 100), ('k5a', 'Relative Accelerator Pedal Position', 'float', '%', 1, 0, 0, 100), ('k45', 'Relative Throttle Position', 'float', '%', 1, 0, 0, 100), ('k1f', 'Run Time Since Engine Start', 'float', 's', 1, 0, 0, 100), ('kff1001', 'Speed (GPS)', 'float', 'km/h', 1, 0, 0, 160), ('kd', 'Speed (OBD)', 'float', 'km/h', 1, 1, 0, 160), ('k11', 'Throttle Position (Manifold)', 'float', '%', 1, 0, 0, 100), ('kff124a', 'Tilt (x)', 'float', NULL, 1, 0, NULL, NULL), ('kff124b', 'Tilt (y)', 'float', NULL, 1, 0, NULL, NULL), ('kff124c', 'Tilt (z)', 'float', NULL, 1, 0, NULL, NULL), ('ke', 'Timing Advance', 'float', '&deg;', 1, 0, -64, 63), ('kff1225', 'Torque', 'float', 'ft-lb', 1, 0, 0, 100), ('kfe1805', 'Transmission Temperature (Method 1)', 'float', '&deg;C', 1, 0, 0, 105), ('kb4', 'Transmission Temperature (Method 2)', 'float', '&deg;C', 1, 0, 0, 105), ('kff1206', 'Trip Average KPL', 'float', 'kpl', 1, 0, 0, 100), ('kff1208', 'Trip Average Litres/100 KM', 'float', 'l/100km', 1, 0, 0, 100), ('kff1205', 'Trip Average MPG', 'float', 'mpg', 1, 0, 0, 100), ('kff1204', 'Trip Distance', 'float', 'km', 1, 0, 0, 200), ('kff120c', 'Trip Distance (Stored in Vehicle Profile)', 'float', 'km', 1, 0, 0, 100), ('kff1266', 'Trip Time (Since Journey Start)', 'float', 's', 1, 0, 0, 100), ('kff1268', 'Trip Time (Whilst Moving)', 'float', 's', 1, 0, 0, 100), ('kff1267', 'Trip Time (Whilst Stationary)', 'float', 's', 1, 0, 0, 100), ('kff1202', 'Turbo Boost & Vacuum Gauge', 'float', 'psi', 1, 0, -20, 20), ('k42', 'Voltage (Control Module)', 'float', 'V', 1, 0, 0, 16), ('kff1238', 'Voltage (OBD Adapter)', 'float', 'V', 1, 0, 0, 16), ('kff1269', 'Volumetric Efficiency (Calculated)', 'float', '%', 1, 0, NULL, NULL), ('k2110', 'k2110', 'varchar(255)', NULL, 1, 0, NULL, NULL), ('kff1005', 'kff1005', 'varchar(255)', NULL, 1, 0, NULL, NULL), ('kff1005', 'GPS Longitude', 'double', '&deg;', 1, 0, 0, 100), ('k2110', 'Exhaust Gas Temperature', 'float', '&deg;C', 1, 0, 0, 800), ('k2102', 'Transmission Temperature', 'float', '&deg;C', 1, 0, -40, 215), ('kff1007', 'kff1007', 'varchar(255)', NULL, 1, 0, NULL, NULL), ('kff1007', 'GPS Altitude', 'float', 'm', 1, 0, 0, 100), ('kf210', 'Boost', 'float', 'psi', 1, 0, 0, 35), ('kf210', 'kf210', 'varchar(255)', NULL, 1, 0, NULL, NULL), ('k2102', 'k2102', 'varchar(255)', NULL, 1, 0, NULL, NULL)
