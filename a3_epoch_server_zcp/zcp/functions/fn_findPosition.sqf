private ["_i","_safepos","_validspot","_position"];
_safepos = [getMarkerPos "center",0,8500,(_this select 0),0,0.5,0];
_validspot  = false;
_i  = 1;
while{!_validspot} do {
sleep 1;
_position  = _safepos call BIS_fnc_findSafePos;
_i  = _i + 1;
_validspot = true;
if (_position call ZCP_fnc_inDebug) then { 
_validspot = false; 
}; 
 
 
//Check if near another capture point
// Get nearest Flag_Green_F (used in the cap base and nowhere else)
_nearOtherCap = (nearestObjects [_position,["Flag_Green_F"],1000]) select 0; 
_nearestCap = _position distance _nearOtherCap;
if (_nearestCap < 1000) then {
_validspot = false; 
};
 
 
//Check if near player base
// Get nearest player jammer
_nearJammer = (nearestObjects [_position,["PlotPole_EPOCH"],500]) select 0; 
_nearestJammer = _position distance _nearJammer;
if (_nearestJammer < 500) then {
_validspot = false; 
};
 
//Check if near protected zone (spawn points or trader base)
// Get nearest player jammer
_nearProtectedZone = (nearestObjects [_position,["ProtectionZone_Invisible_F"],500]) select 0; 
_nearestTrader = _position distance _nearProtectedZone;
if (_nearestTrader < 500) then {
_validspot = false; 
};
 
if(_validspot ) then {
if ([_position,10] call ZCP_fnc_nearWater) then { 
_validspot = false;
}; 
};
};
_position set [2, 0];
_position
