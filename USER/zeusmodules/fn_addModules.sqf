[] spawn {
  waitUntil {!isNull player};
  waitUntil {  time > 3 };

  {
    private _curator = _x;
    
      _curator addEventHandler ["CuratorGroupPlaced", {
          params ["", "_group"];

          { 
              _x setSkill ["aimingAccuracy", 0.3];
              _x setSkill ["aimingShake", 0.2]; 
              _x setSkill ["aimingSpeed", 0.9]; 
              _x setSkill ["endurance", 0.6]; 
              _x setSkill ["spotDistance", 1]; 
              _x setSkill ["spotTime", 0.9]; 
              _x setSkill ["courage", 1]; 
              _x setSkill ["reloadSpeed", 1]; 
              _x setSkill ["commanding", 1];
              _x setSkill ["general", 1];

              _x addGoggles "fsob_Beard01_Dark";
          } forEach units _group;

          ["GRAD_missionControl_setServerAsOwner", [_group]] call CBA_fnc_serverEvent;
      }];

      _curator addEventHandler ["CuratorObjectPlaced", {
          params ["", "_object"];
          
          _object setSkill ["aimingAccuracy", 0.3];
          _object setSkill ["aimingShake", 0.2]; 
          _object setSkill ["aimingSpeed", 0.9]; 
          _object setSkill ["endurance", 0.6]; 
          _object setSkill ["spotDistance", 1]; 
          _object setSkill ["spotTime", 0.9]; 
          _object setSkill ["courage", 1]; 
          _object setSkill ["reloadSpeed", 1]; 
          _object setSkill ["commanding", 1];
          _object setSkill ["general", 1];

          if (_object isKindOf "CAManBase") then {
             if (count units _object == 1) then {
                 ["GRAD_missionControl_setServerAsOwner", [group _object]] call CBA_fnc_serverEvent;
             };
          } else {
             if (count crew _object > 1) then {
                 ["GRAD_missionControl_setServerAsOwner", [group (crew _object select 0)]] call CBA_fnc_serverEvent;
             };
         };

      }];

  } forEach allCurators;
};

["Guardian Angel - Mission Progress", "Civ Convoy 1 Spawn", {
     params ["_position", "_object"];
     
     missionNameSpace setVariable ["grad_civ_convoy_1", true, true];

     // remove this element from zeus
     private _index = [zen_custom_modules_list, "Civ Convoy 1 Spawn"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Mission Progress", "Civ Convoy 2 Spawn", {
     params ["_position", "_object"];
     
     missionNameSpace setVariable ["grad_civ_convoy_2", true, true];

     // remove this element from zeus
     private _index = [zen_custom_modules_list, "Civ Convoy 2 Spawn"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Mission Progress", "Civ Convoy 3 Spawn", {
     params ["_position", "_object"];
     
     missionNameSpace setVariable ["grad_civ_convoy_3", true, true];

     // remove this element from zeus
     private _index = [zen_custom_modules_list, "Civ Convoy 3 Spawn"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Mission Progress", "Civ Convoy 4 Spawn", {
     params ["_position", "_object"];
     
     missionNameSpace setVariable ["grad_civ_convoy_4", true, true];

     // remove this element from zeus
     private _index = [zen_custom_modules_list, "Civ Convoy 4 Spawn"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;



["Guardian Angel - Mission Progress", "RadioMessage START - First task", {
     params ["_position", "_object"];
     
     [[-1], "USER\intel\radioMessage.sqf"] remoteExec ["BIS_fnc_execVM"];

     // remove this element from zeus
     private _index = [zen_custom_modules_list, "RadioMessage START - First task"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Mission Progress", "RadioMessage 0 - German Convoy", {
     params ["_position", "_object"];
     
     [[0], "USER\intel\radioMessage.sqf"] remoteExec ["BIS_fnc_execVM"];
     missionNameSpace setVariable ["grad_blufor_convoy", true, true];

     // remove this element from zeus
     private _index = [zen_custom_modules_list, "RadioMessage 0 - German Convoy"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Mission Progress", "RadioMessage 1 - Convoy ambushed", {
     params ["_position", "_object"];
     
     [[1], "USER\intel\radioMessage.sqf"] remoteExec ["BIS_fnc_execVM"];

     // remove this element from zeus
     private _index = [zen_custom_modules_list, "RadioMessage 1 - Convoy ambushed"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Mission Progress", "RadioMessage 2 - Arty counter", {
     params ["_position", "_object"];
     
     [[4], "USER\intel\radioMessage.sqf"] remoteExec ["BIS_fnc_execVM"];

     // remove this element from zeus
     private _index = [zen_custom_modules_list, "RadioMessage 2 - Arty counter"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Mission Progress", "RadioMessage 3 - Hostage 1 coordinates", {
     params ["_position", "_object"];
     
     [[2], "USER\intel\radioMessage.sqf"] remoteExec ["BIS_fnc_execVM"];

     // remove this element from zeus
     private _index = [zen_custom_modules_list, "RadioMessage 3 - Hostage 1 coordinates"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Mission Progress", "RadioMessage 4 - Hostage 2 Task", {
     params ["_position", "_object"];
     
     [[5], "USER\intel\radioMessage.sqf"] remoteExec ["BIS_fnc_execVM"];

     // remove this element from zeus
     private _index = [zen_custom_modules_list, "RadioMessage 4 - Hostage 2 Task"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Mission Progress", "RadioMessage 5 - Mission accomplished", {
     params ["_position", "_object"];
     
     [[3], "USER\intel\radioMessage.sqf"] remoteExec ["BIS_fnc_execVM"];

      // remove this element from zeus
     private _index = [zen_custom_modules_list, "RadioMessage 5 - Mission accomplished"] call BIS_fnc_findNestedElement;
     zen_custom_modules_list deleteAt _index;
     [] call zen_common_fnc_reloadDisplay;
     
}] call zen_custom_modules_fnc_register;


["Guardian Angel - Arty", "ArtyFire on this position", {
          params ["_modulePosition", "_vehicle"];

          [_modulePosition] remoteExec ["grad_zeusmodules_fnc_artyFire", 2];
     }
] call zen_custom_modules_fnc_register;




["Guardian Angel - Mission Progress", "Spawn Blufor Victim", {
     params ["_position", "_object"];
     
     private _agl = ASLtoAGL _position;
     [_agl] remoteExec ["grad_zeusmodules_fnc_spawnVictim", 2];
     
}] call zen_custom_modules_fnc_register;


["Guardian Angel - Enemies Cloaked", "Reinforcements Squad", {
     params ["_position", "_object"];
     
     ["squad", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Enemies Open", "Reinforcements Squad", {
     params ["_position", "_object"];
     
     ["squad", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Guardian Angel - Enemies Cloaked", "Reinforcements Fireteam", {
     params ["_position", "_object"];
     
     ["fireteam", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Enemies Open", "Reinforcements Fireteam", {
     params ["_position", "_object"];
     
     ["fireteam", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Guardian Angel - Enemies Cloaked", "Reinforcements specialteam", {
     params ["_position", "_object"];
     
     ["specialteam", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Enemies Open", "Reinforcements specialteam", {
     params ["_position", "_object"];
     
     ["specialteam", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;


["Guardian Angel - Enemies Cloaked", "Reinforcements heavy", {
     params ["_position", "_object"];
     
     ["heavy", true, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;

["Guardian Angel - Enemies Open", "Reinforcements heavy", {
     params ["_position", "_object"];
     
     ["heavy", false, ASLtoAGL _position] remoteExec ["grad_zeusmodules_fnc_reinforcements", 2];
     
}] call zen_custom_modules_fnc_register;



["Guardian Angel - GRAD Leavenotes", "Spawn Note", {
          params ["_modulePosition"]; 
          private _position = ASLtoAGL _modulePosition;

          ["Example Dialog", [["EDIT", "Your text?", "string ping"]], {
			   params ["_message", "_position"]; 
                  // systemchat str _position; 
                  // systemchat (_message select 0);
			   [_position, random 360, _message select 0, ["somewhat",["cramped","EtelkaNarrowMediumPro"]]] remoteExec ["GRAD_leaveNotes_fnc_spawnNote", 2, false];
		  }, { systemchat "cancelled"; }, _position] call zen_dialog_fnc_create;        
     }
] call zen_custom_modules_fnc_register;



["Guardian Angel - Traffic", "Spawn traffic", {
          params ["_modulePosition", "_vehicle"];

          "Traffic spawned" call CBA_fnc_notify;
          [_vehicle] remoteExec ["grad_zeusmodules_fnc_createTraffic", 2];
     }
] call zen_custom_modules_fnc_register;


["Guardian Angel - IED Workshop", "Add hidden IED to vehicle", {
          params ["_modulePosition", "_vehicle"];

          if (_vehicle iskindof "LandVehicle") then {
               "IED added" call CBA_fnc_notify;
               [_vehicle] remoteExec ["grad_zeusmodules_fnc_addHiddenIED", 2];
          } else {
               "Not a vehicle" call CBA_fnc_notify;
          };              
     }
] call zen_custom_modules_fnc_register;





["Guardian Angel - Ambient", "Music Radio",
    {
      // Get all the passed parameters
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      private _radio = (selectRandom ["land_gm_euro_furniture_radio_01", "jbad_radio_b", "Land_FMradio_F"]) createVehicle [0,0,0];
      _radio setPos _position;
      _radio setDir (random 360);

      private _music = (selectRandom ["music1", "music2", "arabicsong1", "arabicsong2"]);
      private _source = createSoundSource [_music, _position, [], 0];
      [_source, _music, _radio, false] call grad_ambient_fnc_soundSourceHelper;
      
      {
        _x addCuratorEditableObjects [[_radio], false];
      } forEach allCurators;

    }] call zen_custom_modules_fnc_register;


["Guardian Angel - Ambient", "Suicide Car Spawn",
    {
      params ["_position", "_object"];
      _position = ASLToAGL _position;

      [_position] remoteExec ["grad_ambient_fnc_suicideCar", 2];

    }] call zen_custom_modules_fnc_register;



["Guardian Angel - Ambient", "Shoot Flare",
    {
      params ["_position", "_object"];
      _position = ASLToAGL _position;

       _position set [2, 250]; private _ammo = "rhsusf_40mm_clusterflare_red" createVehicle _position; 
      _ammo setVelocity [random 1,random 1,1];

    }] call zen_custom_modules_fnc_register;

    

    

["Guardian Angel - End", "Create Chair Circle",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLToAGL _position;
  ["Land_CampingChair_V1_F", _position, count (PlayableUnits + switchableUnits)] call grad_zeusmodules_fnc_createChairCircle;

}] call zen_custom_modules_fnc_register;



