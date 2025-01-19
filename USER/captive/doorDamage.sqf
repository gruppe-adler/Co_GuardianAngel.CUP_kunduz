params ["_door"];

[_door, grad_doorCaptives] call BIS_fnc_attachToRelative;

_door addEventHandler ["HitPart", {
	(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];

	private _unit = grad_doorCaptives;
	
	if (!local _unit) exitWith {};
	
	if (_unit animationPhase "Door_1_sound_source" != 1) then {
		_unit animateSource ["Door_1_sound_source", 1, 4]; 
		deleteVehicle _target;
	}; 
}];
