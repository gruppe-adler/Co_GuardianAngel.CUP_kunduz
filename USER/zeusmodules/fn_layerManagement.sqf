if (!isServer) exitWith {};


/// BLUFOR CONVOY

private _reinforcements1 = getMissionLayerEntities "grad_blufor_convoy";
_reinforcements1 params [["_objects1", []], ["_markers", []], ["_groups1", []]];

private _spawnIndexContainer = 0;

{ 
	if (_x isKindOf "BWA3_Multi_Tropen") then {
		private _flatbed = "BWA3_WLP14_Flatbed_Tropen" createVehicle [0,0,0];
		private _type = ["BWA3_WLP14_Ammo_Tropen", "BWA3_TCK9_Fuel_Tropen", "BWA3_WLP14_Repair_Tropen", "BWA3_Skorpion_Tropen"] select (_spawnIndexContainer % 4);

		_spawnIndexContainer = _spawnIndexContainer + 1;
		private _container = _type createVehicle [0,0,0];
		_flatbed setVehicleCargo _container;

		_flatbed hideObjectGlobal true;
		_container hideObjectGlobal true;

		_flatbed attachTo [_x, [0, -1.99, 1.05], "pritsche_complete", true];
		_x setVariable ["BWA3_Multi_LoadedContainer", _flatbed, true]; 
	};

	_x hideObjectGlobal true;

} forEach _objects1;



[{
	params ["_objects", "_groups"];
	missionNameSpace getVariable ["grad_blufor_convoy", false]
},{
	params ["_objects", "_groups"];

	// show all attached ladepritschen and their cargo
	{
		_x enableSimulationGlobal true;
		_x hideObjectGlobal false;

		{ 
			_x hideObjectGlobal false;
			{ _x hideObjectGlobal false; } forEach attachedObjects _x;
		} forEach attachedObjects _x;
	} forEach _objects;
	
	// sort leader to beginning
	private _unitsFound = [];
	{ 
		private _index = _x getVariable ["grad_convoy_index", -1];
		if (_index > -1) then {
			_unitsFound set [_index, _x];
			/*if (_index == 0) then {
				_unitsFound = [_x] + _unitsFound;
			} else {
				systemchat str _unitsFound;
				_unitsFound set [_index, _x];
			};*/
		};
	} forEach _objects;
	// systemchat str _unitsFound;

	[_unitsFound, [3285.93,1369.55,0]] call grad_zeusmodules_fnc_simpleConvoy;	

}, [_objects1, _groups1]] call CBA_fnc_waitUntilAndExecute;





/// CIV CONVOY 1

private _reinforcements2 = getMissionLayerEntities "grad_civ_convoy_1";
_reinforcements2 params [["_objects2", []], ["_markers", []], ["_groups2", []]];

private _spawnIndexContainer = 0;

{ 
	_x hideObjectGlobal true;

	{ 
		_x hideObjectGlobal true;
		{ _x hideObjectGlobal true; } forEach attachedObjects _x;
	} forEach attachedObjects _x;
} forEach _objects2;

[{
	params ["_objects", "_groups"];
	missionNameSpace getVariable ["grad_civ_convoy_1", false]
},{
	params ["_objects", "_groups"];

	// show all attached ladepritschen and their cargo
	{
		_x enableSimulationGlobal true;
		_x hideObjectGlobal false;

		{ 
			_x hideObjectGlobal false;
			{ _x hideObjectGlobal false; } forEach attachedObjects _x;
		} forEach attachedObjects _x;
	} forEach _objects;
	
	// sort leader to beginning
	private _unitsFound = [];
	{ 
		private _index = _x getVariable ["grad_convoy_index", -1];
		if (_index > -1) then {
			_unitsFound set [_index, _x];

			if (_index == 0) then {
				private _music = selectRandom ["music1", "music2", "arabicsong1", "arabicsong2"];
				private _source = createSoundSource [_music, getPos _x, [], 0];
      			[_source, _music, _x, false] call grad_ambient_fnc_soundSourceHelper;
			};
		};
	} forEach _objects;


	[_unitsFound, getPos obj_tangente_south] call grad_zeusmodules_fnc_simpleConvoy;	

}, [_objects2, _groups2]] call CBA_fnc_waitUntilAndExecute;



//// CIV CONVOY 2

private _reinforcements2 = getMissionLayerEntities "grad_civ_convoy_2";
_reinforcements2 params [["_objects2", []], ["_markers", []], ["_groups2", []]];

private _spawnIndexContainer = 0;

{ 
	_x hideObjectGlobal true;
} forEach _objects2;

[{
	params ["_objects", "_groups"];
	missionNameSpace getVariable ["grad_civ_convoy_2", false]
},{
	params ["_objects", "_groups"];

	// show all attached ladepritschen and their cargo
	{
		_x enableSimulationGlobal true;
		_x hideObjectGlobal false;

		{ 
			_x hideObjectGlobal false;
			{ _x hideObjectGlobal false; } forEach attachedObjects _x;
		} forEach attachedObjects _x;
	} forEach _objects;
	
	// sort leader to beginning
	private _unitsFound = [];
	{ 
		private _index = _x getVariable ["grad_convoy_index", -1];
		if (_index > -1) then {
			_unitsFound set [_index, _x];
		};
	} forEach _objects;


	[_unitsFound, getPos obj_tangente_north] call grad_zeusmodules_fnc_simpleConvoy;	

}, [_objects2, _groups2]] call CBA_fnc_waitUntilAndExecute;
