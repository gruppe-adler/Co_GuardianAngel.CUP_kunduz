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
