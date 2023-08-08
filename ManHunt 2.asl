// ManHunt 2 Autosplitter Version 2.0.0 19/8/2022
// Supports IGT/LRT/RTA
// Supports all difficulties
// Pointers and Script <by> ||LeonSReckon||

state("ManHunt2")
{
	float IGT: 0x2E5A8C, 0xF58, 0x58;
	int Menu: 0x206BA0, 0x0;
	int lvls: 0x35F14C, 0x2E0;
	int lvl: 0x142514, 0x0;
	int Cutscene: 0x1ABB7C, 0x14;
	int clip: 0x30A44C, 0x4;
	float Pos: 0x3D71C0, 0x34;
}

startup
{
		settings.Add("LRT", true, "LRT");
		settings.SetToolTip("LRT", "Tick this box if you're using load remover timer");
		settings.Add("IGT", false, "IGT");
		settings.SetToolTip("IGT", "Tick this box if you're using in game timer");
}

init
{
	vars.totalGameTime = 0;
}

start
{
	if(settings["LRT"] || settings["IGT"]){
		if(current.IGT > old.IGT){
			vars.totalGameTime = 0;
			return true;
		}
	}
}

split
{
	if(settings["LRT"]){
		if(current.lvl > old.lvl || current.IGT == old.IGT && current.lvl == 14 && current.Cutscene == 1 && current.Pos > 110){
			return true;
		}
	}
    
    if(settings["IGT"]){
	if (current.lvl > old.lvl) {
        return true; 
		}
	}

}
	
isLoading
{
	if(settings["LRT"]){
		
		if(current.Menu == 0 || current.Menu == 4){
			return true;
		}
        else{
            return false;
        }
	}
	
	if(settings["IGT"]){
		return true;
	}
}

gameTime
{
	if(settings["IGT"]){
		if(current.IGT > old.IGT){
		return TimeSpan.FromSeconds(Math.Floor(vars.totalGameTime + current.IGT));
	}
	if(current.IGT == 0 && old.IGT > 0){
			vars.totalGameTime = System.Math.Floor(vars.totalGameTime + old.IGT);
			return TimeSpan.FromSeconds(System.Math.Floor(vars.totalGameTime + current.IGT));
		}
	}
}
// reset
// {
// 	if(settings["LRT"] || settings["IGT"]){
// 		if(current.IGT == old.IGT && old.IGT > 0 && current.Menu == 0 && current.Cutscene == 0 && ){
// 		return true;
// 	}
// 	}
// }

