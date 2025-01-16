params ["_heli", "_duration"];

if (isNull _heli || didJIP) exitWith {
    "introBlackLoading" cutText ["", "BLACK IN", 5];
};
diwako_dui_main_toggled_off = true;
0 fadeSound 0; 

playMusic "Track_P_15";


showCinemaBorder true;

private _camera = "camera" camCreate [3991, 2918, 3];
_camera cameraEffect ["internal","back"];
_camera camCommand "inertia on";
_camera camSetTarget [4343, 3036, 30];
_camera camSetFOV 0.25;
_camera camCommit 0;

_camera camsetPos [4018, 2865, 3];
_camera camCommit _duration;

private _lightpoint = "#lightpoint" createVehicleLocal [3991, 2918, 50];
_lightpoint setLightColor [1, 1, 1];
_lightpoint setLightAmbient [1, 1, 1];
_lightpoint setLightIntensity 40000000; 
_lightpoint setLightAttenuation [100000, 2, 4, 4, 0, 9, 10];  


[{
    "introBlackLoading" cutText ["", "BLACK IN", 5];
}, [], 5] call CBA_fnc_waitAndeXecute;


[{
    "introBlackLoading" cutText ["", "BLACK OUT", 5];
}, [], _duration-6] call CBA_fnc_waitAndeXecute;


[{
    params ["_camera", "_lightPoint"];

    deleteVehicle _lightPoint; 
    _camera cameraEffect ["terminate","back"];
    camDestroy _camera;
    showCinemaBorder false;
    5 fadeSound 1;
     "introBlackLoading" cutText ["", "BLACK IN", 5];
     diwako_dui_main_toggled_off = false;

     20 fadeMusic 0;

     introtexture setObjectTexture [0, ""];
    
}, [_camera, _lightPoint], _duration] call CBA_fnc_waitAndeXecute;

