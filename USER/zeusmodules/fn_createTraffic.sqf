private _classname = selectRandom [
	"UK3CB_TKC_C_Ikarus",
	"UK3CB_TKC_C_Datsun_Civ_Closed",
	"UK3CB_TKC_C_Datsun_Civ_Open",
	"UK3CB_TKC_C_Hatchback",
	"UK3CB_TKC_C_Hilux_Civ_Closed",
	"UK3CB_TKC_C_Hilux_Civ_Open",
	"UK3CB_TKC_C_Kamaz_Covered",
	"UK3CB_TKC_C_Kamaz_Fuel",
	"UK3CB_TKC_C_Kamaz_Repair",
	"UK3CB_TKC_C_Lada",
	"UK3CB_TKC_C_Lada_Taxi",
	"UK3CB_TKC_C_Lada",
	"UK3CB_TKC_C_Lada_Taxi",
	"UK3CB_TKC_C_Lada",
	"UK3CB_TKC_C_Lada_Taxi",
	"UK3CB_TKC_C_LR_Open",
	"UK3CB_TKC_C_LR_Closed",
	"UK3CB_TKC_C_Pickup",
	"UK3CB_TKC_C_V3S_Reammo",
	"UK3CB_TKC_C_V3S_Refuel",
	"UK3CB_TKC_C_V3S_Repair",
	"UK3CB_TKC_C_V3S_Closed",
	"UK3CB_TKC_C_V3S_Open",
	"UK3CB_TKC_C_Sedan",
	"UK3CB_TKC_C_Sedan",
	"UK3CB_TKC_C_Sedan",
	"UK3CB_TKC_C_Skoda",
	"UK3CB_TKC_C_Skoda",
	"UK3CB_TKC_C_Skoda",
	"UK3CB_TKC_C_UAZ_Closed",
	"UK3CB_TKC_C_Ural_Open",
	"UK3CB_TKC_C_Ural_Repair"
];

private _path = call grad_zeusmodules_fnc_trafficpath_1;

private _firstPathPos = _path select 0;
private _secondPathPos = _path select 1;
_firstPathPos deleteAt 3;
_secondPathPos deleteAt 3;
private _dir = _firstPathPos getDir _secondPathPos;

private _vehicle = createVehicle [_classname, _firstPathPos, [], 0, "NONE" ];
_vehicle setDir _dir;
private _crew = createVehicleCrew _vehicle;

_vehicle setDriveOnPath _path;


private _existingTraffic = missionNamespace getVariable ["grad_traffic", []];
_existingTraffic pushBackUnique _vehicle;
missionNamespace getVariable ["grad_traffic", _existingTraffic, true];


[{
	params ["_args", "_handle"];
	_args params ["_vehicle"];

	// Parameters
	private _coneDistance = 50;                 // Distance of the cone
	private _coneAngle = 30;                    // Half-angle of the cone (in degrees)
	private _existingTraffic = missionNamespace getVariable ["grad_traffic", []];

	// Get the direction of the cone
	private _coneDir = (vectorNormalized (vectorDir _vehicle));

	// debug cone
	[_vehicle, _coneDir, _coneAngle] call grad_traffic_debug;

	// Filter objects within the cone
	private _objectsInCone = _existingTraffic select {
		private _objPos = getPosATL _x;
		private _objVector = _objPos vectorFromTo (getPosATL _vehicle); // Vector to object
		private _objDir = vectorNormalized _objVector;                 // Normalized direction
		private _angle = acos (_coneDir vectorDotProduct _objDir);    // Angle between vectors (in radians)

		// Convert cone angle to radians and check
		(_angle <= (_coneAngle * 0.0174533)) // (degrees to radians)
	};

	if (count _objectsInCone > 0 || _vehicle getVariable ["grad_traffic_stopped", false]) then {
		_vehicle limitSpeed 0;
	} else {
		_vehicle limitSpeed 100;
	};

}, 0, [_vehicle]] call CBA_fnc_addPerFrameHandler;


// Function to rotate a vector by an angle
private _rotateVector = {
	params ["_vector", "_angleDeg"];
	private _angleRad = _angleDeg * 0.0174533; // Convert to radians
	private _cosA = cos _angleRad;
	private _sinA = sin _angleRad;

	// Rotate vector in 2D (assuming Z is up)
	[
		(_vector select 0) * _cosA - (_vector select 1) * _sinA,
		(_vector select 0) * _sinA + (_vector select 1) * _cosA,
		0
	]
};


grad_traffic_debug = {
	params ["_vehicle", ];

	// Calculate cone boundary vectors
	private _leftBoundary = [_coneDir, -_coneAngle] call _rotateVector; // Rotate left
	private _rightBoundary = [_coneDir, _coneAngle] call _rotateVector; // Rotate right

	// Extend boundaries to the cone distance
	private _leftEnd = _originPos vectorAdd (_leftBoundary vectorMultiply _coneDistance);
	private _rightEnd = _originPos vectorAdd (_rightBoundary vectorMultiply _coneDistance);
	private _forwardEnd = _originPos vectorAdd (_coneDir vectorMultiply _coneDistance);

	// Draw debug lines
	drawLine3D [_originPos, _leftEnd, _coneColor];   // Left boundary
	drawLine3D [_originPos, _rightEnd, _coneColor];  // Right boundary
	drawLine3D [_originPos, _forwardEnd, _coneColor];// Forward line

	// Optional: Draw connecting lines for better visualization
	drawLine3D [_leftEnd, _forwardEnd, _coneColor];  // Left to forward
	drawLine3D [_rightEnd, _forwardEnd, _coneColor]; // Right to forward
};