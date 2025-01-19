params ["_messageCount"];

private _message = "";
private _duration = 0;

switch (_messageCount) do {
	case -1: {
		_message = "ANGEL for CROSSROAD. Welcome to this routine mission. Proceed to checkpoint and monitor traffic. Priority: inspect for contraband, explosives, and potential vehicle-borne IEDs. Maintain security and report suspicious activity. CROSSROAD out.";
		playSound "radiomessage_start";
		_duration = 21;
	};
	case 0: { 
		_message = "ANGEL for CROSSROAD. Be advised: German convoy approaching from the north turning west at your checkpoint. No action required. Maintain routine monitoring. CROSSROAD out.";
		playSound "radiomessage0";
		_duration = 14;
	};
	case 1: { 
		_message = "ANGEL for CROSSROAD. Be advised: German convoy ambushed. Immediate assistance required. You are tasked to abort current roadblock duty and move to the bridge south-west sector. Conduct rapid assessment of the situation and provide all necessary support. Maintain communication with HQ and advise on status. Time is critical. CROSSROAD out!";
		playSound "radiomessage1";
		_duration = 28;
	};
	case 2: { 
		_message = "ANGEL for CROSSROAD. Enemy communication intercepted regarding hostages. Signal traced to grid coordinates 009 050. You are directed to proceed to the location 009 050 and investigate immediately. Exercise caution and report findings promptly. CROSSROAD out!";
		playSound "radiomessage2";
		_duration = 26;
	};
	case 3: { 
		_message = "ANGEL for CROSSROAD. Mission accomplished. Hostages successfully recovered—well executed. Stand by no further tasking. Break. You are ordered to RTB for debrief, resupply, and re-tasking prep. Maintain tactical awareness en route. CROSSROAD out! I love you sexy motherfuckers!";
		playSound "radiomessage3";
		_duration = 24;
	};
	case 4: { 
		_message = "ANGEL for CROSSROAD. Enemy artillery targeting your position. Task: Identify origin and neutralize. Maintain caution. Report progress. Acknowledge and execute. CROSSROAD out.";
		playSound "radiomessage6";
		_duration = 14;
	};
	case 5: { 
		_message = "ANGEL for CROSSROAD. Intel references a cave at Kar Shek with an SOS. Task: Investigate, confirm enemy presence or hostages. Proceed with caution. Report findings. Acknowledge and execute. CROSSROAD out.";
		playSound "radiomessage7";
		_duration = 17;
	};
	default { };
};

[_message, _duration, "TahomaB"] spawn GM_MISSIONS_fnc_rtty_text;

player creatediarysubject ["GUARDIAN ANGEL", "GUARDIAN ANGEL"];
player createDiaryRecord ["GUARDIAN ANGEL", [str (_messageCount + 2) + " - " + ([daytime, "HH:MM"] call BIS_fnc_timeToString), _message]];
